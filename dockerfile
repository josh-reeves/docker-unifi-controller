FROM ubuntu:jammy
WORKDIR /setup
COPY setup.sh .
RUN chmod +x setup.sh
RUN ./setup.sh
CMD service unifi start && tail -F /usr/lib/unifi/logs/server.log
EXPOSE 8443
