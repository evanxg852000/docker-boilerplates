FROM node:carbon-alpine

LABEL maintainer="Evance Soumaoro <evanxg852000@gmail.com>"

# create app directory
RUN mkdir -p /usr/devserver
WORKDIR /usr/devserver

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD [ "./run.sh" ]
