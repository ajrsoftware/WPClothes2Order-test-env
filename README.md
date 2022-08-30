# WPClothes2Order testing enviroment

Due to the nature of this project & the main plugin being held in a seperate repo, alot of the setup is manual.

-   Start of development - `docker compose up`

-   Visit `http://localhost:8000`

-   Use the info shown in `.github/assets/env-credentials.png` for consistency

-   Download & unzip the plugin from `https://github.com/AshleyRedman/WPClothes2Order` on the dev branch to the `app/wp-content/plugins` dir

-   In the WP admin UI, activate the plugin

-   Reminder, this is a WooCommerce extention, not stand alone, so WC is required. No version specified yet.

The command `docker compose down` removes the containers and default network, but preserves your WordPress database.
The command `docker compose down --volumes` removes the containers, default network, and the WordPress database.
