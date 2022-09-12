FROM node:alpine 
RUN mkdir -p /app
WORKDIR /app
COPY package*.json .
RUN npm i
COPY . .
EXPOSE  8080

CMD ["npm", "start"]