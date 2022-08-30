#!bin/bash

# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
php wp-cli.phar --info;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;

# Allow chance for MySQL to be ready
sleep 10;

# Setup WP & base admin user
wp core install --url=http://localhost:8000 --title=WPCLothes2Order-test-env --admin_user=admin --admin_password=password --admin_email=test@test.com --color --allow-root;

# Skip WC setup wizard
rm -r wp-content/mu-plugins;
mkdir wp-content/mu-plugins;
touch wp-content/mu-plugins/env.php;
echo '<?php add_filter("woocommerce_prevent_automatic_wizard_redirect", "__return_true" );' >> wp-content/mu-plugins/env.php;

# Remove plugins that come with WP
wp plugin delete hello --allow-root;
wp plugin delete akismet --allow-root;

# Insatll WC
wp plugin install woocommerce --force --activate --allow-root;

# Install WPClothes2Order plugin from dev branch of repo
wp plugin install https://github.com/AshleyRedman/WPClothes2Order/archive/refs/heads/dev.zip --force --activate --allow-root;
