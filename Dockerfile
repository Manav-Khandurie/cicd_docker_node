# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY ./my-app/package*.json ./

# Install app dependencies
RUN npm install

# Copy the current directory contents to the container at /app
COPY ./my-app/ .

# Build the React app
RUN npm run build

# Set environment variables
ENV PORT=80

# Expose the port the app runs on
EXPOSE $PORT

# Start the application
CMD ["npm", "start"]
