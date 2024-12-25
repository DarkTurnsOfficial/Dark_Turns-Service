FROM node:20-alpine

RUN apk add --no-cache git

RUN git clone https://github.com/Arkhaviss/Interstellar.git

WORKDIR /Interstellar

RUN npm install

CMD npm start