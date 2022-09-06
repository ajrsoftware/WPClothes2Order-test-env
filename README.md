# WPClothes2Order testing environment

## Assumptions

-   This guide is for MacOS & Linux users, I currently do not use a windows machine, so a PR on this README on how to get started with a windows setup would be appreciated
-   We assume you have composer on your system, for more information, please [see here](https://getcomposer.org/doc/00-intro.md) on how to get setup with composer.

## Getting started

-   Clone this repo
-   Navigate into the root of the project
-   Ensure you have docker running
-   Run `sh quickstart.sh`

This will setup a dockerized WordPress env on `http://localhost:8000` and clone down the WPClothes2Order plugin on the dev branch ready to go.
See the `quickstart.sh` for more detail.

## Development

This environment is simply just for development/testing. Once you have completed the above steps, navigate to `cd app/wp-content/plugins/WPClothes2Order` and start.
As this is a sub git directory, the plugin files are what can be checked in and submit for PR.

Once you navigate to `http://localhost:8000`, login by going to `http://localhost:8000/wp-login.php`.
Credentials:
Username: admin
Password: admin

-   Within this environment, there is an container running mailhog on `http://localhost:1025`, here we can test out going mail.
-   Within this environment, there is a container running adminer on `http://localhost:8080`, here we can view & edit the database.

Once you log into the local site, you will see WooCommerce is activated & the WPC2O plugin is not. This is because it is running the dev build, so:

-   From this projects root, `cd app/wp-content/plugins/WPClothes2Order`
-   Run `composer install`
-   Return to the plugin screen & activate the plugin.

You're now ready to go!

If you spot a bug with this setup or have any questions, please open an issue on this project or use (this link)[https://github.com/AshleyRedman/WPClothes2Order-test-env/issues].
