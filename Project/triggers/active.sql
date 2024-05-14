CREATE OR REPLACE FUNCTION project.activate_device_sensors() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.DeviceStatus = 'Active' THEN
    UPDATE project.Sensors SET SensorStatus = 'Active' WHERE DeviceID = NEW.DeviceID;
  END IF;
  RETURN NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER activate_device_sensors
AFTER UPDATE OF DeviceStatus ON project.Devices
FOR EACH ROW WHEN (NEW.DeviceStatus = 'Active')
EXECUTE PROCEDURE project.activate_device_sensors();


UPDATE project.Devices
SET DeviceStatus = 'Active'
WHERE DeviceName = 'Fitbit';