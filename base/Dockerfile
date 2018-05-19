FROM centos:7
MAINTAINER jackhhh

WORKDIR /usr/local

# Change Repo to TUNA
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
RUN curl -LO "ftp://ftp.bitnp.net/Software/ML/CentOS-Base.repo"
RUN mv CentOS-Base.repo /etc/yum.repos.d/
RUN yum makecache

# install system tool
RUN yum install -y which
RUN yum clean all

# install Java
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/jdk-8u162-linux-x64.tar.gz" && \
  tar zxf jdk-8u162-linux-x64.tar.gz
RUN rm -f jdk-8u162-linux-x64.tar.gz
ENV JAVA_HOME /usr/local/jdk1.8.0_162
ENV JRE_HOME $JAVA_HOME/jre  
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH

# install Scala
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/scala-2.12.4.tgz" && \
  tar zxf scala-2.12.4.tgz
RUN rm -rf scala-2.12.4.tgz

ENV SCALA_HOME /usr/local/scala-2.12.4
ENV PATH $SCALA_HOME/bin:$PATH

# install Hadoop
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/hadoop-2.7.5.tar.gz" && \
  tar zxf hadoop-2.7.5.tar.gz
RUN rm -rf hadoop-2.7.5.tar.gz

ENV HADOOP_HOME /usr/local/hadoop-2.7.5
ENV PATH $HADOOP_HOME/bin:$PATH
ENV PATH $HADOOP_HOME/sbin:$PATH
ENV HADOOP_PREFIX $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV YARN_HOME $HADOOP_HOME
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV HADOOP_LIBEXEC_DIR $HADOOP_HOME/libexec
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_PREFIX/lib/native
ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_PREFIX/lib/native"

RUN sed -i 's/${JAVA_HOME}/\/usr\/local\/jdk1.8.0_162/g' $HADOOP_HOME/etc/hadoop/hadoop-env.sh
RUN sed -i 's/localhost/spark-worker1\nspark-worker2/g' $HADOOP_HOME/etc/hadoop/slaves
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/hadoop/core-site.xml" && \
  mv core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/hadoop/hdfs-site.xml" && \
  mv hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/hadoop/mapred-site.xml" && \
  mv mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/hadoop/yarn-site.xml" && \
  mv yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml

# install Spark
RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/spark-2.3.0-bin-hadoop2.7.tgz" && \
  tar zxf spark-2.3.0-bin-hadoop2.7.tgz
RUN rm -rf spark-2.3.0-bin-hadoop2.7.tgz

ENV SPARK_HOME /usr/local/spark-2.3.0-bin-hadoop2.7
ENV PATH $SPARK_HOME/bin:$PATH
ENV PATH $SPARK_HOME/sbin:$PATH

RUN \
  curl -LO "ftp://ftp.bitnp.net/Software/ML/spark/spark-env.sh" && \
  mv spark-env.sh $SPARK_HOME/conf/spark-env.sh && \
  chmod 755 $SPARK_HOME/conf/spark-env.sh
RUN cp $SPARK_HOME/conf/slaves.template $SPARK_HOME/conf/slaves
RUN sed -i 's/localhost/spark-master\nspark-worker1\nspark-worker2/g' $SPARK_HOME/conf/slaves