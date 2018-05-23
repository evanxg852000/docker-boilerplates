FROM python:3.6-jessie

LABEL maintainer="Evance Soumaoro <evanxg852000@gmail.com>"

RUN pip install pipenv

# create app directory
RUN mkdir -p /usr/appserver
WORKDIR /usr/appserver

COPY Pipfile* ./
RUN pipenv install --system

COPY . .

EXPOSE 9000

CMD [ "./run.sh" ]