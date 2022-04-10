#!/bin/sh

HADOOP_VERSION='3.3.1'
SPARK_VERSION='3.2.1'
SPARK_HADOOP_COMPAT='3.2'
SCALA_VERSION='-scala2.13'

#APACHE_MIRROR="http://mirror.dsrg.utoronto.ca/apache/"
APACHE_MIRROR="http://ftp.unicamp.br/pub/apache/"
#APACHE_MIRROR="https://www-us.apache.org/dist/"

HADOOP_TARFILE="hadoop-${HADOOP_VERSION}.tar.gz"
HADOOP_APACHE_PATH="hadoop/common/hadoop-${HADOOP_VERSION}/${HADOOP_TARFILE}"
SPARK_TARFILE="spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_COMPAT}${SCALA_VERSION}.tgz"
SPARK_APACHE_PATH="spark/spark-${SPARK_VERSION}/${SPARK_TARFILE}"

mkdir -p sw
wget -nc ${APACHE_MIRROR}${HADOOP_APACHE_PATH} -O sw/${HADOOP_TARFILE}
wget -nc ${APACHE_MIRROR}${SPARK_APACHE_PATH} -O sw/${SPARK_TARFILE}

