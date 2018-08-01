# Summary
Fully featured boilerplate Rails API designed for use with a modern single page app. Designed to have everything you need to get your app up and running quickly! 

Ruby Version: 2.5.1

Rails Version: 5.2.0


# Features 
1. Authentication using Devise and Devise Token Auth 
2. Password Reset and User Sign Up flow with mailing and recaptcha validation option
3. CSV and PDF file generation 
4. ActionCable setup with background job
5. Test suite configured to work with Devise/Devise Token Auth strategies using Rspec, FactoryBot, and Guard
6. Configured to work with client/server on different domains

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

# Endpoints 

## Action Cable Connection 
/api/cable

## User Signup and Login Flow

**Signup User:** 
POST api/users, Required Params: first_name, last_name, email, password, password_confirmation

**Login User:**
POST api/auth/sign_in, Required Params: email, password

**Logout User:**
DELETE api/auth/sign_out

**Send Forgot Password Email:**
POST /api/generate_new_password_email

**Reset Password:**
PUT /api/reset_password

## Sample CSV and PDF Downloads

**CSV Export:**
GET api/users/export_csv

**PDF Export:**
GET api/users/export_pdf

# Authentication 
Devise Token Auth is set up to authenticate each request. This can be disabled to use custom devise session login paths. 

# File downloads
Prawn is used for PDF generation. 

Example render in controller: 
```
@clients = Client.all
render "export_pdf.pdf.prawn" 
```

Included is a custom CSV template generator. To use in controller actions that render CSV data, render the custom template with a filetype of .csv.rb:

Example render in controller: 
```
@clients = Client.all
render "client_data.csv.rb"
```

Corresponding view:
```
# Header 
csv << ["Date Created", "First Name", "Last Name", "Email"]

# Output each client in a separate line in a CSV
@clients.each do |client|
  first = client.first_name
  last = client.last_name
  date_created = client.created_at.strftime('%-m/%-d/%Y')
  email = client.email

  csv << [ date_created, first, last, email ]
end

```


