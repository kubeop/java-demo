FROM k8sre/openjdk:8

COPY entrypoint.sh         /

RUN apk update                             && \
    apk upgrade                            && \
    chmod 755 /entrypoint.sh

COPY target/java-demo-0.0.2.jar /opt/demo.jar

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
