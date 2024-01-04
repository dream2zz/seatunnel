FROM openjdk:8

ENV SEATUNNEL_VERSION="2.3.3"
ENV SEATUNNEL_HOME="/opt/seatunnel"

RUN wget https://dlcdn.apache.org/seatunnel/${SEATUNNEL_VERSION}/apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz && \
    tar -xzvf apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz && \
    mv apache-seatunnel-${SEATUNNEL_VERSION} ${SEATUNNEL_HOME}

WORKDIR ${SEATUNNEL_HOME}

RUN ./bin/install-plugin.sh ${SEATUNNEL_VERSION}
