--Get the sensor that has the most data entries

SELECT s.SensorType, COUNT(sd.DataID) as data_count
FROM project.SensorData sd
JOIN project.Sensors s ON sd.SensorID = s.SensorID
GROUP BY s.SensorType
ORDER BY data_count DESC
LIMIT 1;