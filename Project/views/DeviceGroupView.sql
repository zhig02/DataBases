CREATE VIEW project.DeviceGroupView AS
SELECT d.DeviceID, d.DeviceName, d.DeviceType, d.DeviceStatus, g.GroupID, g.GroupName
FROM project.DeviceGroups g
JOIN project.Devices d ON g.DeviceID = d.DeviceID;