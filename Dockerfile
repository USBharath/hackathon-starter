FROM node:18-slim
# FROM node:19.5.0-alpine

WORKDIR /starter
ENV NODE_ENV development

COPY package.json /starter/package.json

RUN npm install pm2 -g
RUN npm install sass
RUN npm install --production --force
# RUN npm i

COPY .env.example /starter/.env.example
COPY . /starter
#RUN npm install --production
CMD ["pm2-runtime","app.js"]

EXPOSE 3000
