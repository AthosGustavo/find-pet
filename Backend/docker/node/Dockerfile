FROM node:18

WORKDIR /app-node

COPY ["yarn.lock","package.json","./"]

RUN yarn install

COPY . .

RUN yarn build

CMD ["yarn", "start"]

