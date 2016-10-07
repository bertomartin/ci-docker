FROM mhart/alpine-node:5.6.0

EXPOSE 3000

RUN mkdir /app
WORKDIR /app

ADD package.json /app/package.json
RUN npm install -g npm --prefix=/usr/local
RUN ln -s -f /usr/local/bin/npm /usr/bin/npm

ADD . /app

CMD ["node", "server.js"]