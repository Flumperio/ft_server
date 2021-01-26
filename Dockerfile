FROM debian:buster
WORKDIR /tmp

RUN apt-get -q update
RUN apt-get -q upgrade

RUN apt-get install wget -yq
#para comprobar que funciona - BORRAR -
RUN apt-get install curl -yq

#install nginx
RUN apt-get install nginx -yq
COPY ./srcs/test.sh /tmp/test.sh
RUN chmod 775 /tmp/test.sh
CMD /tmp/test.sh

