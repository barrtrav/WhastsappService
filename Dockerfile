FROM node:24-alpine

RUN apk update && \
    apk add --no-cache git ffmpeg wget curl bash openssl tzdata

WORKDIR /evolution

COPY . .

RUN chmod +x ./Docker/scripts/* && dos2unix ./Docker/scripts/*
RUN ./Docker/scripts/generate_database.sh
RUN npm ci --silent
RUN npm run build

ENV TZ=America/Sao_Paulo
ENV DOCKER_ENV=true

EXPOSE 8080

CMD ["npm", "run", "start:prod"]