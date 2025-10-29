FROM node:20-alpine

# Install git
RUN apk add --no-cache git

# Clone your MAIN repository (Vortex-Nexus-X)
RUN git clone https://github.com/DarkTurnsOfficial/Vortex-Nexus-X.git

# Set working directory
WORKDIR /Vortex-Nexus-X

# Install dependencies
RUN npm install

# Expose the port (Render will override with PORT env var)
EXPOSE 8080

# Set production environment
ENV NODE_ENV=production

# Health check to help Render know when app is ready
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD node -e "require('http').get('http://localhost:' + (process.env.PORT || 8080), (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Start the application
CMD ["npm", "start"]
