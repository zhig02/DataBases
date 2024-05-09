--Get the devices that have more than a certain number of sensors

SELECT d.DeviceName
FROM project.DeviceSensors ds
JOIN project.Devices d ON ds.DeviceID = d.DeviceID
GROUP BY d.DeviceName
HAVING COUNT(ds.SensorID) > 1;