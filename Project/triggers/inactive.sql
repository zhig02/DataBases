CREATE OR REPLACE FUNCTION project.deactivate_device_sensors() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.DeviceStatus = 'Inactive' THEN
    UPDATE project.Sensors SET SensorStatus = 'Inactive' WHERE DeviceID = NEW.DeviceID;
  END IF;
  RETURN NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER deactivate_device_sensors
AFTER UPDATE OF DeviceStatus ON project.Devices
FOR EACH ROW WHEN (NEW.DeviceStatus = 'Inactive')
EXECUTE PROCEDURE project.deactivate_device_sensors();


UPDATE project.Devices
SET DeviceStatus = 'Inactive'
WHERE DeviceName = 'Fitbit';