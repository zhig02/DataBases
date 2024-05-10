--Get the devices that have more than a certain number of sensors

SELECT d.DeviceName
FROM project.Sensors s
JOIN project.Devices d ON s.DeviceID = d.DeviceID
GROUP BY d.DeviceName
HAVING COUNT(s.SensorID) > 1;