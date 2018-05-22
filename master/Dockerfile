FROM registry.cn-beijing.aliyuncs.com/bitnp/docker-spark-hadoop:latest

MAINTAINER jackhhh

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /usr/local/spark-2.3.0-bin-hadoop2.7/logs

EXPOSE 8080 7077 6066

CMD ["/bin/bash","/master.sh"]
