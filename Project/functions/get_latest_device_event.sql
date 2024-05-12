CREATE OR REPLACE FUNCTION project.get_latest_device_event(p_DeviceName VARCHAR(255))
RETURNS TABLE (
  DeviceName VARCHAR(255),
  EventID INTEGER,
  EventType VARCHAR(255),
  EventTimestamp TIMESTAMP
) AS $$
BEGIN
  RETURN QUERY
  SELECT d.DeviceName, e.EventID, e.EventType, e.EventTimestamp
  FROM project.Events e
  JOIN project.Devices d ON e.DeviceID = d.DeviceID
  WHERE d.DeviceName = p_DeviceName
  ORDER BY e.EventTimestamp DESC
  LIMIT 1;
END; $$ LANGUAGE plpgsql;

SELECT * FROM project.get_latest_device_event(
    'Apple CarPlay'
    );