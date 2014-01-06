
echo "Adding Wordpress Plugins..."
cd /srv/www/wordpress-default
wp plugin install json-api
wp plugin activate json-api

# take ownership of the folders that npm/node use
# this script runs under root, assign permission to the vagrant user for npm
sudo mkdir -p /usr/local/{share/man,bin,lib/node,lib/node_modules,include/node}
sudo chown -R vagrant /usr/local/{share/man,bin,lib/node,lib/node_modules,include/node}

echo "Adding Express for Node..."
npm install -y -g express

echo "Adding additional packages for Node..."
npm install -y request
npm install -y -g forever
npm install -y forever-monitor

# provision express if it is not there
if [ ! -d '/srv/www/node/wp-ingester' ]; then
    mkdir /srv/www/node
    express /srv/www/node/wp-ingester
fi

cd /srv/www/node/wp-ingester
npm install -d

echo "Starting NodeJS Server"
# log file should not be in www this is temporary
forever --sourceDir '/srv/www/node/wp-ingester' \
    -a -l '/srv/www/node/node.log' \
    --minUptime 5000 \
    --spinSleepTime 2000 \
    start app.js