# BDT-Project-Sem-6

# Big Data Hospital Log Analysis & Threat Detection

## Project Overview
This project utilizes the Hadoop Big Data ecosystem to process, clean, and analyze massive volumes of hospital network and device logs. The goal is to detect hidden cybersecurity threats ("Low and Slow" attacks) and predict hardware failures in medical equipment.

## Technologies Used
* **Apache Sqoop:** Data ingestion from legacy RDBMS (MySQL) to HDFS.
* **Hadoop (HDFS):** Distributed, fault-tolerant storage for massive log datasets.
* **MapReduce (Python/Java):** Parsing, filtering, and cleaning unstructured raw text logs.
* **Apache Hive:** Data warehousing and executing SQL-like analytical queries to detect anomalies.
* **Oracle VirtualBox & Cloudera:** Development environment.

## Project Structure
* `/docs` - Contains project presentations (PPTs) and architecture diagrams.
* `/dataset` - Contains the sample raw hospital logs.
* `/scripts` - Contains the `sqoop_ingestion.sh` bash scripts.
* `/hive` - Contains `hive_analytics.sql` for threat detection queries.
* `/mapreduce` - Contains the Mapper and Reducer logic for data cleaning.

## How to Run
1. Start the Cloudera QuickStart VM.
2. Run the Sqoop script to import data to HDFS: `bash sqoop_ingestion.sh`
3. Execute the MapReduce job to clean the data.
4. Open the Hive shell and execute the queries in `hive_analytics.sql`.
