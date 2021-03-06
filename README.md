# Code challenge: Fibonnaci Frontend & Backend - Julio Sanchez

## Description

The Fibonacci sequence is a well known algorithm, the challenge is to build a web application, a fibonacci calculator. The input for the calculator is the position of the fibonacci sequence, the output should be the value of the sequence at a given position.
This challenge is separated in two sections, backend, and frontend, each section has its own acceptance criteria and requirements, please read the instructions carefully. 

## Quickstart

### To start the whole solution:
```bash
docker-compose up --build
```

Wait until _Vite_ and _Rails_ are listening.

Then browse to: `http://localhost:3000`

### To run backend's test suite.
```bash
docker-compose run --rm fibonacci_test bundle exec rspec
```
⚠️**Important Note**: This won't work if you haven't executed `docker-compose up --build`.

### To stop and tear down containers and volumes:
```bash
docker-compose down -v
```

## Backend

**API-only** + **No-Active-Record** rails project.

### Stack
- Ruby	3.0.4
- Rails	6.1.6
- Docker	20.10.10

## Client

**Vite** app.

### Stack
- Node	18.3.0
- NPM		8.12.1
- Vite	2.9.4
- React	18.1.0
- Docker	20.10.10

Using Vite tooling, instead of Webpack, because of its many benefits: 1) technology agnostic, 2) performance advantages, 3) code splitting, 4) pre-package building. [Vite](https://vitejs.dev/guide/why.html) 

## Additional Commands

Open a Rails (fibonacci_app) shell
```bash
docker-compose exec fibonacci_app sh
```

Open React (client) shell
```bash
docker-compose exec client sh
```