FROM jojomi/hugo:0.52 AS build-env

WORkDIR /app
COPY ./site ./

RUN sh -c './build.sh'

# build runtime image
FROM nginx:1.15.7-alpine

COPY --from=build-env /app/public/ /www/domingosuarez.com/public/
COPY conf/nginx/* /etc/nginx/conf.d