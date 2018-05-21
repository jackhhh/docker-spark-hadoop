#!/bin/bash

# master startup

# hadoop startup

# hadoop namenode -format
# hadoop-daemon.sh start namenode
# hadoop-daemon.sh start datanode
# yarn-daemon.sh start resourcemanager
# yarn-daemon.sh start nodemanager
# mr-jobhistory-daemon.sh start historyserver


# spark startup

export SPARK_MASTER_HOST=`hostname`

. "/usr/local/spark-2.3.0-bin-hadoop2.7/sbin/spark-config.sh"

. "/usr/local/spark-2.3.0-bin-hadoop2.7/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/usr/local/spark-2.3.0-bin-hadoop2.7

cd /usr/local/spark-2.3.0-bin-hadoop2.7/bin && /usr/local/spark-2.3.0-bin-hadoop2.7/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
