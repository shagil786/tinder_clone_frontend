FROM node:18.0.0 as build 


WORKDIR /react-app


COPY package*.json .


RUN yarn install


COPY . .


RUN yarn run build


FROM nginx:1.25


COPY ./nginx/nginx.conf /etc/nginx/nginx.conf


COPY --from=build /react-app/build /usr/share/nginx/html