# Code challenge: Fibonnaci Backend - Julio Sanchez

## Description

The Fibonacci sequence is a well known algorithm, the challenge is to build a web application, a fibonacci calculator. The input for the calculator is the position of the fibonacci sequence, the output should be the value of the sequence at a given position.
This challenge is separated in two sections, backend, and frontend, each section has its own acceptance criteria and requirements, please read the instructions carefully. 

## Backend

New API-only / No-Active-Record rails project.

### Stack
Ruby	3.0.4
Rails	6.1.6
Docker	20.10.10

## Client

New Create-React-App app.

### Stack
Node	18.3.0
NPM		8.12.1
Vite	2.9.4
React	18.1.0
Docker	20.10.10

Using Vite tooling, instead of Webpack, because of its many benefits: 1) technology agnostic, 2) performance advantages, 3) code splitting, 4) pre-package building. [Vite](https://vitejs.dev/guide/why.html) 

## Commands

Open Fibonacci app shell
```bash
docker-compose exec fibonacci_app sh
```

Open React client shell
```bash
docker-compose exec client sh
```