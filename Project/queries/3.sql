--Get the number of devices in each device group

SELECT dg.GroupName, COUNT(dg.DeviceID)
FROM project.DeviceGroups dg
JOIN project.Devices d ON dg.DeviceID = d.DeviceID
GROUP BY dg.GroupName;