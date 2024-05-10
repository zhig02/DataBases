--Get the users who have a device with a specific sensor

SELECT DISTINCT u.UserName
FROM project.UserDevices ud
JOIN project.Users u ON u.UserID = ud.UserID
JOIN project.Devices d ON ud.DeviceID = d.DeviceID
JOIN project.Sensors s ON s.DeviceID = d.DeviceID
WHERE s.SensorType = 'Infrared Sensor';