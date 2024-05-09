--Get the most recent event for each device

SELECT d.DeviceName, MAX(e.EventTimestamp) as LatestEvent
FROM project.Events e
JOIN project.Devices d ON e.DeviceID = d.DeviceID
GROUP BY d.DeviceName;