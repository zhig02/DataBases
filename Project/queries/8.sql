--Get the sensor with the highest average data value

SELECT s.SensorType, AVG(sd.DataValue) as avg_value
FROM project.SensorData sd
JOIN project.Sensors s ON sd.SensorID = s.SensorID
GROUP BY s.SensorType
ORDER BY avg_value DESC
LIMIT 1;