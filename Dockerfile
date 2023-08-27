FROM node:18-slim

WORKDIR /starter
ENV NODE_ENV development

# COPY package.json /starter/package.json
COPY . /starter

# RUN npm install pm2 -g
RUN npm install -g npm@9.8.1
RUN npm install sass
# RUN npm install --production
RUN npm i

COPY .env.example /starter/.env.example
COPY . /starter

CMD ["node","app.js"]

EXPOSE 8080
