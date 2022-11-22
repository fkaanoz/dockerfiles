FROM ubuntu:latest

RUN apt-get update --yes && apt-get upgrade --yes

RUN apt-get install curl --yes
RUN apt-get install vim --yes

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
apt-get install -y nodejs

ENV PORT=3001

RUN useradd fkaanoz && usermod -aG sudo fkaanoz && su fkaanoz 

ADD ./app1 /home/fkaanoz/dev/app1

WORKDIR /home/fkaanoz/dev/app1

CMD ["npm", "run", "dev"]
