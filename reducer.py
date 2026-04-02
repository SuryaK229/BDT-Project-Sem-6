import sys

current_ip = None
current_count = 0

# Reducer: Aggregates the statuses for each IP address
for line in sys.stdin:
    line = line.strip()
    ip, status = line.split('\t', 1)

    if current_ip == ip:
        current_count += 1
    else:
        if current_ip:
            print(f"{current_ip}\t{current_count}")
        current_ip = ip
        current_count = 1

if current_ip == ip:
    print(f"{current_ip}\t{current_count}")
