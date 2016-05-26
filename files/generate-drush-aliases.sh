#!/bin/bash
user=$1

echo "Generating drush aliases for user '$user' fetch from Consul..."
consul-template \
    -consul ${CONSUL_CONNECT} \
    -template "/consul-template/templates/drush-aliases.ctmpl:/home/"$user"/.drush/aliases.drushrc.php" \
    -once \
    -log-level ${CONSUL_LOGLEVEL} \
    -retry=2s

echo "Change ownership of '/home/$user/.drush/'"
chown -R $user:$user /home/$user/.drush/