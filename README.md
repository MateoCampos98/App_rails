STORE

It is an application that can function as an e-commerce, with TDD practices, Rspec for testing and Sass for the front end.

Ruby Version

This application is built with Ruby version *3.2.2*.

System Dependencies

To run this application, ensure you have the following system dependencies installed:

- Ruby 3.2.2
- PostgreSQL (for the database)
- Redis (optional, for Action Cable in production)

Configuration

1. Clone the repository:

git clone <git@github.com:MateoCampos98/App_rails.git>
cd store

Install the required gems:

bundle install

2. Create and setup the database:

rails db:create
rails db:migrate

3. If you are using Docker, build the Docker image:

docker build -t your-app-name .
Run the application in development mode:

sudo docker-compose up

Database Creation
To create the database, run:

rails db:create
Database Initialization

4. To run the test suite, use the following command:

bundle exec rspec

Services
This application includes background jobs and WebSockets. Ensure that any required services (like Redis) are running in your environment.

5. Deployment Instructions
To deploy the application to production, follow these steps:

Commands for Using Gems
Mailers (ActionMailer): Use mailers for sending emails.
Background Jobs: Use Active Job to manage background processing.
View Components: Use reusable view components to build your UI.
Sass and SassC: Compile your stylesheets using Sass.