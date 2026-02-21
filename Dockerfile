# Used stable version-LTS
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies-into image
RUN npm install

# Copy remaining files
COPY . .

# Expose application port inside container
EXPOSE 3000
# Start the script inside package.json-when container runs
CMD ["npm", "start"]

