FROM eclipse-temurin:17

ENV SEATUNNEL_VERSION="2.3.3"
ENV SEATUNNEL_HOME="/opt/seatunnel"

RUN wget https://dlcdn.apache.org/seatunnel/${SEATUNNEL_VERSION}/apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz && \
    tar -xzvf apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz && \
    mv apache-seatunnel-${SEATUNNEL_VERSION} ${SEATUNNEL_HOME}

WORKDIR ${SEATUNNEL_HOME}

RUN echo  "--connectors-v2-- \n connector-fake \n\
connector-console \n\
connector-http-base \n\
connector-kafka \n\
connector-jdbc \n\
connector-cdc-mysql \n\
connector-starrocks \n\
--end--" > ./config/plugin_config

RUN ./bin/install-plugin.sh ${SEATUNNEL_VERSION}
