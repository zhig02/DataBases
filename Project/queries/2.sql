--Get the average data value for each sensor type

SELECT s.SensorType, AVG(sd.DataValue)
FROM project.Sensors s
JOIN project.SensorData sd ON s.SensorID = sd.SensorID
GROUP BY s.SensorType;