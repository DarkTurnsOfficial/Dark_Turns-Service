FROM node:20-alpine

RUN apk add --no-cache git

RUN git clone https://github.com/DarkTurnsOfficial/Vortex-Nexus-X.git

WORKDIR /Vortex-Nexus-X

RUN npm install

CMD npm start
