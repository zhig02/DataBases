--Get the users who have a device with a specific sensor

SELECT DISTINCT u.UserName
FROM project.Users u
JOIN project.UserDevices ud ON u.UserID = ud.UserID
JOIN project.DeviceSensors ds ON ud.DeviceID = ds.DeviceID
JOIN project.Sensors s ON ds.SensorID = s.SensorID
WHERE s.SensorType = 'Infrared Sensor';