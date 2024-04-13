# Use an official Node runtime as a parent image
FROM node:14.17-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Bundle app source inside the Docker image
COPY . .

# Build the app for production
RUN npm run build

# Use serve to serve static content
# Note: You would usually install `serve` globally inside your image
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose the port the app runs on
EXPOSE 5000
