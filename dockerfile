FROM ubuntu:jammy
WORKDIR /setup
COPY setup.sh .
RUN chmod +x setup.sh
RUN ./setup.sh
CMD service unifi start && tail -F /usr/lib/unifi/logs/server.log
EXPOSE 8443/tcp
EXPOSE 8080/tcp
EXPOSE 6789/tcp
EXPOSE 27117/tcp
EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 3478/udp
EXPOSE 5514/udp
EXPOSE 10001/udp
EXPOSE 1900/udp
EXPOSE 123/udp
EXPOSE 5656-5699/udp