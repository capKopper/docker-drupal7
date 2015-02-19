FROM capkopper/php-fpm

# Install drush for root user ...
ENV DRUSH_VERSION 6.4.0
RUN composer global require drush/drush:$DRUSH_VERSION

# ... and then add a runit pre-script to move drush binary only for the given user
ADD files/install-drush.sh /init.d/pre-install-drush.sh