CREATE OR REPLACE VIEW project.DeviceAndSensorStatus AS
SELECT d.DeviceName, d.DeviceStatus, s.SensorType, s.SensorStatus
FROM project.Devices d
LEFT JOIN project.Sensors s ON d.DeviceID = s.DeviceID;