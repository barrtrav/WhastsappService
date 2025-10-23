FROM node:18

WORKDIR /app
RUN git clone https://github.com/evolution-api/evolution-api.git .
RUN npm install

EXPOSE 3000
CMD ["npm", "start"]
