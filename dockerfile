FROM debian:stable-slim
WORKDIR /setup
COPY ./setup/ .
VOLUME /user/lib/data
EXPOSE 22/tcp
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
RUN chmod +x setup.sh && ./setup.sh
USER unifi
ENTRYPOINT service unifi start && tail -F /usr/lib/unifi/logs/server.log
