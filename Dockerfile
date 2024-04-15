FROM nginx:latest
MAINTAINER "nidhikashyap168@gmail.com"
RUN apt-get update && apt-get upgrade -y && apt-get install -y git
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server
RUN apt-get install -y net-tools
COPY src/main/webapp/index.jsp /usr/share/nginx/html/index.html
RUN chmod 777 /usr/share/nginx/html/index.html
EXPOSE 80
ENTRYPOINT service nginx start && bash
