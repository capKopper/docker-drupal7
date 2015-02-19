#!/bin/bash
user=$1

echo "Installing drush for user '$user'..."
mv /root/.composer /home/$user/ && chown -R $user:$user /home/$user/.composer
ln -s /home/$user/.composer/vendor/bin/drush /usr/local/bin/
