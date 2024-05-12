CREATE VIEW project.UserDevicesView AS
SELECT u.UserID, u.UserName, u.UserEmail, d.DeviceID, d.DeviceName, d.DeviceType, d.DeviceStatus
FROM project.UserDevices ud
JOIN project.Users u ON ud.UserID = u.UserID
JOIN project.Devices d ON ud.DeviceID = d.DeviceID;