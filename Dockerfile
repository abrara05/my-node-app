# Use official Node.js image
FROM node:18

# Set app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Expose port and run app
EXPOSE 3000
CMD ["npm", "start"]

