import csv
import psycopg2

conn = psycopg2.connect(
    dbname="pg_db",
    user="postgres",
    password="postgres",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

def get_user_id(name, table):
    cur.execute(f"SELECT userid FROM project.{table} WHERE username = %s", (name,))
    return cur.fetchone()[0]

def get_device_id(name, table):
    cur.execute(f"SELECT deviceid FROM project.{table} WHERE devicename = %s", (name,))
    return cur.fetchone()[0]

with open('./insertion/UserDevices.csv', 'r') as csv_file:
    reader = csv.DictReader(csv_file)
    for row in reader:
        user_id = get_user_id(row['User'], 'Users')
        device_id = get_device_id(row['Device'], 'Devices')
        cur.execute(
            "INSERT INTO project.UserDevices(UserID, DeviceID) VALUES (%s, %s)",
            (user_id, device_id)
        )

conn.commit()
cur.close()
conn.close()