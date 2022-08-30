#!bin/bash

WP_CONFIG=wp-config.php;
URL=http://localhost:8000;
TITLE=WPCLothes2Order-test-env;
ADMIN_USER=admin;
ADMIN_PASS=password;
ADMIN_EMAIL=test@test.com;

# If config exists

if [ -f $WP_CONFIG ]; then
  echo "$WP_CONFIG already exsists! Please remove the `app` directroy & try again.";
  echo "Warning! This action will setup a fresh test env installation";
  exit 0;
fi

# Install WP-CLI
echo "Installing the WP CLI";
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
php wp-cli.phar --info;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

# Allow chance for MySQL to be ready & wait for config to be generated
until [ -f $WP_CONFIG ]
do
     echo "$WP_CONFIG not found, waiting for it to be generated...";
     sleep 5;
done
echo "$WP_CONFIG found...";

# Setup WP & base admin user
echo "Auto installing WordPress";
wp core install --url=$URL --title=$TITLE--admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --color --allow-root;

# Update WP to latest stable
echo "Updating WordPress to the latest stable build";
wp cli update --stable --yes --allow-root;

# Set correct permalink strucutre
echo "Setting correct permalink structure";
wp rewrite structure '/%postname%/' --hard --allow-root;

# Remove must-use dir & re-create
echo "Cleaning up must-use plugins";
rm -r wp-content/mu-plugins;
mkdir wp-content/mu-plugins;

# Skip WC setup wizard
touch wp-content/mu-plugins/env.php;
echo '<?php add_filter("woocommerce_prevent_automatic_wizard_redirect", "__return_true" );' >> wp-content/mu-plugins/env.php;

# Remove plugins that come with WP
echo "Removing default plugins";
wp plugin delete hello --allow-root;
wp plugin delete akismet --allow-root;

# Insatll WC
echo "Installing Woocommerce";
wp plugin install woocommerce --force --activate --allow-root;

# Install WPClothes2Order plugin from dev branch of repo
echo "Installing & activating the WPCLothes2Order plugin - dev build";
wp plugin install https://github.com/AshleyRedman/WPClothes2Order/archive/refs/heads/dev.zip --force --activate --allow-root;

echo "Environment ready.";
