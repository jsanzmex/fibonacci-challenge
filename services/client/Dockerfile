# pull official base image
FROM node:18-alpine

ENV VITE_PORT 3000

# set working directory
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json .
COPY package-lock.json .

RUN npm ci

EXPOSE $VITE_PORT

# start app
CMD ["npm", "run", "dev"]