-- Hospital Log Analysis - HiveQL Scripts

-- 1. Create the Database and Table
CREATE DATABASE IF NOT EXISTS hospital_security;
USE hospital_security;

CREATE EXTERNAL TABLE IF NOT EXISTS clean_logs (
    log_timestamp STRING,
    ip_address STRING,
    device_id STRING,
    action_status STRING,
    error_code STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/cloudera/hospital_logs/cleaned_data';

-- 2. Detect Brute Force / Low & Slow Attacks (Security)
-- Flags IP addresses with excessive failed logins
SELECT ip_address, COUNT(*) as failed_attempts 
FROM clean_logs 
WHERE action_status = 'FAILED' 
GROUP BY ip_address 
HAVING failed_attempts > 10
ORDER BY failed_attempts DESC;

-- 3. Predictive Maintenance (Operational Health)
-- Finds medical devices throwing repeated error codes
SELECT device_id, error_code, COUNT(*) as error_frequency
FROM clean_logs
WHERE error_code IS NOT NULL AND error_code != '200'
GROUP BY device_id, error_code
HAVING error_frequency > 5
ORDER BY error_frequency DESC;
