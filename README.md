# Service Dev setup

After cloning the repository, follow the next steps to have the project's BE up and running:

## Guide

- [Service Dev setup](#service-dev-setup)
  - [Guide](#guide)
  - [Description](#description)
  - [System dependencies](#system-dependencies)
  - [Execute code](#execute-code)
  - [Execute Tests](#execute-tests)
  - [WIKI](#wiki)

## Description
  Simple BE project that mock the response to client called ECHO-SERVER 
  ```
  consist of one url: /endpoints
  with the whole CRUD operation to create any custom endpoint to the client  
  ```
## System dependencies

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose ^1.2.4](https://docs.docker.com/compose/install/)
## Execute code

    docker-compose up --build
## Setup Tests 
   docker exec -it backend rails db:test:prepare
## Execute Tests

    docker exec -it backend bundle exec rspec


## WIKI

- [EchoServer](https://github.com/ahmadessamshahin/echo_server/wiki/EchoServer)


- [Endpoints](https://github.com/ahmadessamshahin/echo_server/wiki/Endpoints)
