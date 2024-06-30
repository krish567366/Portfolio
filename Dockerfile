# Use an official Node.js image as the base image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the package.json file
COPY package*.json ./

# Install dependencies
RUN npm install

USER 10014

# Copy the rest of the application code
COPY . .

# Expose the port your application will use
EXPOSE 3000

# Run the command to start your application
CMD ["npm", "start"]
