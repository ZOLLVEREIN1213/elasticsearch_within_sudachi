# Build Stage Countainer: Build Sudachi for Elasticsearch
FROM maven:3-jdk-8 AS maven

# Clone elasticsearch-sudachi
RUN git clone https://github.com/WorksApplications/elasticsearch-sudachi.git
WORKDIR /elasticsearch-sudachi

# Build Sudachi
RUN mvn package

###########################################################################
# Base image: Elasticsearch(7.5.0)
FROM docker.elastic.co/elasticsearch/elasticsearch:7.5.0

# Deploy Sudachi zip
COPY --from=maven /elasticsearch-sudachi/target/releases/analysis-sudachi-elasticsearch7.5-1.3.3-SNAPSHOT.zip /usr/share/elasticsearch/sudachi.zip

# Install Sudachi on Elasticsearch
RUN bin/elasticsearch-plugin install file:///usr/share/elasticsearch/sudachi.zip

# Deploy Sudachi system dictionary
COPY ./config/system_full.dic /usr/share/elasticsearch/config/sudachi/system_full.dic

# Deploy sudachi.json(Sudachi configuration file)
COPY ./config/sudachi.json /usr/share/elasticsearch/config/sudachi/sudachi.json