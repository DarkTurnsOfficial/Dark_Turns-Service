FROM node:20-alpine

# Install git for cloning
RUN apk add --no-cache git

# Clone your repository
RUN git clone https://github.com/DarkTurnsOfficial/Vortex-Nexus-X.git

# Set working directory
WORKDIR /Vortex-Nexus-X

# Install dependencies (use npm ci for faster, more reliable builds)
RUN npm install

# Expose port (Render will use the PORT environment variable)
EXPOSE 8080

# Set production environment
ENV NODE_ENV=production

# Start the application
CMD ["npm", "start"]
