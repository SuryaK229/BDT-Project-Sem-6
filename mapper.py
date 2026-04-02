import sys

# Mapper: Reads raw text logs and extracts IP addresses and status
for line in sys.stdin:
    line = line.strip()
    words = line.split(',')
    
    # Assuming CSV format: timestamp, ip_address, device, status, error
    if len(words) == 5:
        ip_address = words[1]
        status = words[3]
        print(f"{ip_address}\t{status}")
