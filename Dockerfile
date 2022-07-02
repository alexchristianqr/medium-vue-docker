# Dockerfile vuejs
FROM node:14-alpine as alpineServer
COPY . /myserver/www
WORKDIR /myserver/www
RUN npm install && npm run build

# Dockerfile nginx
FROM nginx:stable-alpine as nginxServer
RUN rm -rf /usr/share/nginx/html/*
COPY --from=alpineServer /myserver/www/.docker/nginx/general /etc/nginx/general/
COPY --from=alpineServer /myserver/www/.docker/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY --from=alpineServer /myserver/www/dist /usr/share/nginx/html/dist/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
