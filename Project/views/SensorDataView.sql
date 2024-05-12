CREATE VIEW project.SensorDataView AS
SELECT s.SensorID, s.SensorType, s.SensorStatus, d.DataID, d.DataValue, d.valid_from, d.valid_to
FROM project.SensorData d
JOIN project.Sensors s ON d.SensorID = s.SensorID;