FROM node:carbon-alpine

LABEL maintainer="Evance Soumaoro <evanxg852000@gmail.com>"

# create app directory
RUN mkdir -p /usr/appserver
WORKDIR /usr/appserver

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 9000

CMD [ "./run.sh" ]