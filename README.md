# Rate Your Landlord (Rails API backend)

[Frontend here](https://www.github.com/d-otis/rate-your-landlord-react-frontend)

## Install
1. `bundle install` all gem dependencies
1. `rails db:create` to create the Postgres database
1. then run `psql -d rate_your_landlord_backend_development -c 'CREATE EXTENSION pgcrypto'` in your command line to enable use of Postgres extensions that creates `uuid`s instead of integer database primary keys (change your database name in this command if necessary)
1. `rails db:migrate` to create all necessary tables