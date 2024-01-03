FROM eclipse-temurin:17

ENV SEATUNNEL_VERSION="2.3.3"
ENV SEATUNNEL_HOME="/opt/seatunnel"

RUN wget https://dlcdn.apache.org/seatunnel/${SEATUNNEL_VERSION}/apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz && \
    tar -xzvf apache-seatunnel-${SEATUNNEL_VERSION}-bin.tar.gz && \
    mv apache-seatunnel-${SEATUNNEL_VERSION} ${SEATUNNEL_HOME}

WORKDIR ${SEATUNNEL_HOME}

RUN echo  "--connectors-v2--" > ./config/plugin_config && \
    echo  "connector-fake" >> ./config/plugin_config && \
    echo  "connector-console" >> ./config/plugin_config && \
    echo  "connector-http-base" >> ./config/plugin_config && \
    echo  "connector-kafka" >> ./config/plugin_config && \
    echo  "connector-jdbc" >> ./config/plugin_config && \
    echo  "connector-cdc-mysql" >> ./config/plugin_config && \
    echo  "connector-starrocks" >> ./config/plugin_config && \
    echo  "--end--" >> ./config/plugin_config

RUN ./bin/install-plugin.sh ${SEATUNNEL_VERSION}
