FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN apt-get install -y ant wget bzip2
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN yes | apt-get install -y oracle-java10-installer
RUN apt-get install -y oracle-java10-set-default

RUN wget https://github.com/aionnetwork/aion/releases/download/v0.2.8/aion-v0.2.8.ef5df39c-2018-06-15.tar.bz2
RUN tar xvjf aion-v0.2.8.ef5df39c-2018-06-15.tar.bz2
WORKDIR aion
# Testing
COPY config.xml config/config.xml
RUN rm config/genesis.json
COPY genesis.json config/genesis.json
EXPOSE 8545 8547
CMD ["/bin/sh", "-c", "./aion.sh"]
