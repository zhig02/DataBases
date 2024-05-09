--Get the devices that have never had an event

SELECT d.DeviceName
FROM project.Devices d
LEFT JOIN project.Events e ON d.DeviceID = e.DeviceID
WHERE e.EventID IS NULL;