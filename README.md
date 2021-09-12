# An Experimental Hadoop-in-Docker Deployment

There is nothing production-ready about this Hadoop on Docker configuration, but that's not its job. The goal here is to give enough of a working Hadoop system to experiment and see how it handles failure.

These commands will get the &ldquo;cluster&rdquo; started:
```bash
./get-sw.sh

docker-compose build
docker-compose up
docker-compose run gateway hdfs dfs -copyFromLocal bigfile /bigfile1
```

You can run a command in the &ldquo;gateway&rdquo; node (`pyspark` in this example):
```bash
docker-compose run gateway pyspark
```

And you can do other variously-destructive experiments:
```bash
# Add one more YARN/HDFS node:
docker-compose run yarn-nodemanager-4 /opt/hadoop/bin/yarn nodemanager
docker-compose run hdfs-datanode-4 /opt/hadoop/bin/hdfs datanode

# take down (wait for failure) and restore an HDFS node:
docker-compose stop hdfs-datanode-3
docker-compose start hdfs-datanode-3

# take down, wipe the disk, and restore an HDFS node:
docker-compose stop hdfs-datanode-3
docker-compose rm hdfs-datanode-3
docker-compose up hdfs-datanode-3
```

To clean everything up:
```bash
docker-compose down
docker system prune -f
```
