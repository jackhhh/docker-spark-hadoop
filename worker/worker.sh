#!/bin/bash

. "/usr/local/spark-2.3.0-bin-hadoop2.7/sbin/spark-config.sh"

. "/usr/local/spark-2.3.0-bin-hadoop2.7/bin/load-spark-env.sh"

mkdir -p $SPARK_WORKER_LOG

export SPARK_HOME=/usr/local/spark-2.3.0-bin-hadoop2.7

/usr/local/spark-2.3.0-bin-hadoop2.7/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out
