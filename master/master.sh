#!/bin/bash

# master startup

export SPARK_MASTER_HOST=`spark-master`

. "/usr/local/spark-2.3.0-bin-hadoop2.7/sbin/spark-config.sh"

. "/usr/local/spark-2.3.0-bin-hadoop2.7/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/usr/local/spark-2.3.0-bin-hadoop2.7

cd /usr/local/spark-2.3.0-bin-hadoop2.7/bin && /usr/local/spark-2.3.0-bin-hadoop2.7/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
