FROM node@sha256:02632fa826cdbdaa5fba25032bd2931fc79348c60110fefea2edf3fc480f39c5
# node:lts-slim
# https://hub.docker.com/layers/library/node/lts-slim/images/sha256-02632fa826cdbdaa5fba25032bd2931fc79348c60110fefea2edf3fc480f39c5?context=explore

ENV SRC_WEBSITE="/home/node/website" \
    SRC_MODIFIED_WEBSITE="/home/node/modified_website" \
    BUILD_MEMHIST="/home/node/vue-memHist" \
    BUILD_WEBHIST="/home/node/vue-webHist"

COPY build-entrypoint.sh . 
RUN npm install -g @vue/cli-service @vue/cli vue
ENTRYPOINT ["bash", "build-entrypoint.sh" ]
