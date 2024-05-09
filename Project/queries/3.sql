--Get the number of devices in each device group

SELECT dg.GroupName, COUNT(dg.DeviceID)
FROM project.DeviceGroups dg
GROUP BY dg.GroupName;