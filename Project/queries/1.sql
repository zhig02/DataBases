
--Get all users who have a device of a specific type
SELECT DISTINCT u.UserName
FROM project.Users u
JOIN project.UserDevices ud ON u.UserID = ud.UserID
JOIN project.Devices d ON ud.DeviceID = d.DeviceID
WHERE d.DeviceType = 'Wearable';