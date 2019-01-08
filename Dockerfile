FROM jojomi/hugo:0.53 AS build-env

WORkDIR /app
COPY ./site ./

RUN sh -c './build.sh'

# build runtime image
FROM nginx:1.15.8-alpine

#COPY --from=build-env /app/public/ /www/domingosuarez.com/public/
COPY --from=build-env /app/public/ /usr/share/nginx/html
#COPY conf/nginx/* /etc/nginx/conf.d