import csv
import subprocess
host_ip_addresses = "host_ip_address.csv"

with open ( host_ip_addresses , mode ='r') as file:
    csv_reader = csv.DictReader(file)
    dict_list = []
    for row in csv_reader:
        dict_list.append(row)

for data in dict_list:
    ipaddress = data['host_ip_address']
    command = f"SSHPASS=root sshpass -e ssh-copy-id -i /home/ansuser/.ssh/id_ed25519.pub -o StrictHostKeyChecking=no ansuser@{ipaddress}"
    subprocess.call(command, shell=True)
