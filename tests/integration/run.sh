#!/bin/bash

# List of all the tests
# TESTS="test_mod_backup \
# test_mod_brute_login_form \
# test_mod_cookieflags \
# test_mod_crlf \
# test_mod_csp \
# test_mod_csrf \
# test_mod_exec \
# test_mod_file \
# test_mod_htaccess \
# test_mod_drupal_enum \
# test_mod_http_headers \
# test_mod_methods \
# test_mod_shellshock \
# test_mod_sql \
# test_mod_timeslq \
# test_mod_wp_enum \
# test_mod_xss \
# test_mod_xxe \
# test_crawler_auth \
# test_crawler_redirect "

# List of the currently working tests
TESTS="test_mod_wp_enum \
test_mod_backup \
test_mod_http_headers \
test_mod_file "

# Normalize trailing space for shell substitution
if [[ ! -z "$TESTS" ]]; then
    export TESTS="${TESTS%% } "
fi

# exit upon any error
set -o errexit

# exit upon using undeclared variables
set -o nounset

# Placing ourselves in the right directory
cd "$(dirname "$0")"

# Parsing script arguments 
declare -A args
for arg in "$@"; do
    args[$arg]=1;
done; 

if [[ -v args["--help"] ]]; then
    # Printing some help
    printf "%s\n" \
           "Entrypoint to run integration tests" \
           "Usage: ./run.sh [options]" \
           "Options:" \
           "    --help           Display this message and exit"\
           "    --docker-clean   Kill containers, remove and prune all docker images, volumes, and system, be carefull when using this option"\
           "    --verbose-build  Print the build messages before running the tests";
           exit 0;
fi

if [[ -v args["--docker-clean"] ]]; then
    # Cleaning docker
    docker kill $(docker ps -q) || echo "no containers to kill"
    docker container prune -f || echo "no containers to prune"
    docker volume prune -f || echo "no volumes to prune"
    docker rmi $(docker images -a -q) || echo "no images to remove"
    (docker system prune -f && docker network create test-network) || echo "no need to prune the system"
fi

# Fallback to create the test-network in case it doesn't exist
docker network inspect test-network > /dev/null || docker network create test-network > /dev/null

if [[ ! -v args["--verbose-build"] ]];then
# Quietly build all Dockerfiles
docker compose -f docker-compose.setup.yml build --quiet
fi

# Start the tests
docker compose  --progress quiet -f docker-compose.setup.yml up --abort-on-container-exit

declare -a asserters=()
# If the TESTS env variable is supplied, we will only check the specified tests
if [[ ! -z "$TESTS" ]]; then
    # Assuming all the tests in the TESTS variable are well written and exist
    mapfile -t asserters < <(echo -e "${TESTS// /\/assertions\/check.sh\\n}" |  head -n -1)
else
    # Otherwise, we take all the tests
    mapfile -t asserters < <(find . -mindepth 2 -type l,f -name check.sh)
fi
EXIT_CODE=0
for path in "${asserters[@]}"; do
    cd "$(dirname "${path}")" 
    bash "check.sh" | tee -a ../../.dump_diff_file.txt
    # Workaround to check if check.sh succeed, may not work on zsh 
    if [[ "${PIPESTATUS[0]}" -eq 1 ]]; then
        EXIT_CODE=1
    fi
    cd - > /dev/null 
done
exit $EXIT_CODE
