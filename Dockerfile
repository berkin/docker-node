FROM node:7


RUN cd /tmp \
	&& apt-get update \
	&& apt-get install -y wkhtmltopdf

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app


EXPOSE 8080

CMD [ "npm", "start" ]
