FROM jackhhh/docker-spark-hadoop:latest

MAINTAINER jackhhh

# Start Hadoop
RUN hadoop namenode -format
RUN hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
RUN hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
RUN yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
RUN yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager
RUN mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver

# Start Spark
COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /usr/local/spark-2.3.0-bin-hadoop2.7/logs

EXPOSE 8080 7077 6066

CMD ["/bin/bash","/master.sh"]
