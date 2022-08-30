# WPClothes2Order testing environment

## Getting started

-   Clone this repo
-   Navigate into the root of the project
-   ENsure you have docker running
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

For more information, please contact me at `ash.redman@outlook.com` or for a faster response, direct message me on twitter at `@AJ_Redman`.
