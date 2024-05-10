import csv
import psycopg2

# Connect to your postgres DB
conn = psycopg2.connect(
    dbname="pg_db",
    user="postgres",
    password="postgres",
    host="localhost",
    port="5432"
)

# Open a cursor to perform database operations
cur = conn.cursor()

# Read the sensor types and their statuses from the Sensors.csv file into a dictionary
sensor_statuses = {}
with open('./insertion/Sensors.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader)  # Skip the header row
    for row in reader:
        sensor_type, sensor_status = row
        sensor_statuses[sensor_type] = sensor_status

# Read the Devices and their Sensors from the DeviceSensors.csv file
with open('./insertion/DeviceSensors.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader)  # Skip the header row
    for row in reader:
        device_name, sensor_type = row

        # Get the DeviceID for the current device
        cur.execute("SELECT DeviceID FROM project.Devices WHERE DeviceName = %s", (device_name,))
        device_id = cur.fetchone()[0]

        # Get the SensorStatus for the current sensor
        sensor_status = sensor_statuses[sensor_type]

        # Insert the sensor into the Sensors table
        cur.execute("INSERT INTO project.Sensors (SensorType, SensorStatus, DeviceID) VALUES (%s, %s, %s)", (sensor_type, sensor_status, device_id))

# Commit the changes
conn.commit()

# Close the connection
cur.close()
conn.close()