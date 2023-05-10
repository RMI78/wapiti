FROM wordpress:6.2.0

# Needed dependencies in the setup script
ENV DEPENDENCIES "curl unzip"

# Install zip utility
RUN apt-get update -y \
    && apt-get install ${DEPENDENCIES} -y \
    && apt-get clean -yq \
    && apt-get -y autoremove -yq \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

# Copy the setup script for themes and extensions
COPY ./wp-setup.sh /usr/local/bin/wp-setup.sh
RUN chmod +x /usr/local/bin/wp-setup.sh && /bin/bash wp-setup.sh

# Start Apache
CMD ["apache2-foreground"]
