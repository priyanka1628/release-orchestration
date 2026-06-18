# Dockerfile for the Release Orchestration Platform application

# base image with Node.js 18 on Alpine Linux for a lightweight container
FROM node:18-alpine 

# Sets the working directory inside the container to /app
WORKDIR /app 

# Copies the package.json and package-lock.json files from the host machine to the working directory in the container. This is done to install dependencies defined in these files.
COPY package*.json ./ 

# Installs the dependencies defined in package.json. 
RUN npm install 

# Copies the rest of the application code from the host machine to the working directory in the container. 
COPY . . 

# Exposes port 3000 to allow external access to the application. This is the port on which the application will listen for incoming requests.
EXPOSE 3000 

# The CMD instruction specifies the command to run the application, which starts the server using npm.
CMD ["node", "app.js"]   