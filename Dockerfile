FROM docker.awsl9527.cn/kubeop/openjdk:8-jdk

COPY entrypoint.sh         /

RUN apt-get update                      && \
    chmod 755 /entrypoint.sh

COPY target/java-demo-0.0.2.jar /opt/demo.jar

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]
