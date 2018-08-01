# Summary

Ruby Version: 2.5.1
Rails Version: 5.2.0

# Get started 

### Start Rails Server
`rails -b 0.0.0.0 -p 3005`

### Start Action Cable Server
`bundle exec puma -p 28080 cable/config.ru`

### Run tests
`guard`

# Database Config 
Create a development database:
`createdb development_db_name`

Create a database.yml file:
```
development:
  adapter:  postgresql
  host:     localhost
  encoding: unicode
  database: [name of development database]
  pool:     5
  username:
  password:
  template: template0

test:
  adapter:  postgresql
  host:     localhost
  encoding: unicode
  database: test_db<%= ENV['TEST_ENV_NUMBER'] %>
  pool:     5
  username:
  password:
  template: template0
```
