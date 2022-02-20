# base image
FROM node:16.14.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm config set unsafe-perm true

RUN npm install
RUN npm install @vue/cli@5.0.1 -g

RUN chown -R node /app/node_modules
USER node

# start app
CMD ["npm", "run", "serve"]
