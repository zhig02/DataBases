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

def get_sensor_id(name, table):
    cur.execute(f"SELECT sensorid FROM project.{table} WHERE sensortype = %s", (name,))
    return cur.fetchone()[0]

def get_device_id(name, table):
    cur.execute(f"SELECT deviceid FROM project.{table} WHERE devicename = %s", (name,))
    return cur.fetchone()[0]

with open('./insertion/DeviceSensors.csv', 'r') as csv_file:
    reader = csv.DictReader(csv_file)
    for row in reader:
        device_id = get_device_id(row['Device'], 'Devices')
        sensor_id = get_sensor_id(row['Sensor'], 'Sensors')
        cur.execute(
            "INSERT INTO project.DeviceSensors(DeviceID, SensorID) VALUES (%s, %s)",
            (device_id, sensor_id)
        )


conn.commit()
cur.close()
conn.close()