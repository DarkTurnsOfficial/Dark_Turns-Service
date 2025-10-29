FROM node:20-alpine

# Install git
RUN apk add --no-cache git

# Clone the repository (use a variable to force rebuild on push)
ARG GIT_COMMIT=unknown
RUN echo "Cloning at commit: ${GIT_COMMIT}" && \
    git clone https://github.com/DarkTurnsOfficial/Vortex-Nexus-X.git && \
    cd Vortex-Nexus-X && \
    git pull origin main

# Set working directory
WORKDIR /Vortex-Nexus-X

# Install dependencies
RUN npm install

# Expose port
EXPOSE 8080

# Production environment
ENV NODE_ENV=production

# Start the application
CMD ["npm", "start"]
