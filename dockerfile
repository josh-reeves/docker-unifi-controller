FROM ubuntu:jammy
WORKDIR /setup
COPY setup.sh .
RUN chmod +x setup.sh
CMD ./setup.sh
EXPOSE 8443
