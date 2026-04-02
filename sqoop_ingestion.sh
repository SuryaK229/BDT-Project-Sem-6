#!/bin/bash
# Hospital Log Analysis - Data Ingestion Script
# Pulls raw logs from local MySQL into Hadoop Distributed File System (HDFS)

echo "Starting Sqoop Import..."

sqoop import \
  --connect jdbc:mysql://localhost:3306/hospital_db \
  --username root \
  --password cloudera \
  --table raw_network_logs \
  --target-dir /user/cloudera/hospital_logs/raw_data \
  -m 1

echo "Sqoop Import Completed Successfully."
