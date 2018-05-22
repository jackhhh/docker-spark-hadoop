FROM registry.cn-beijing.aliyuncs.com/bitnp/docker-spark-hadoop:latest

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /usr/local/spark-2.3.0-bin-hadoop2.7/logs
ENV SPARK_MASTER "spark://spark-master:32769"

EXPOSE 8081

CMD ["/bin/bash","/worker.sh"]

