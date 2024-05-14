CREATE OR REPLACE FUNCTION project.prevent_active_device_deletion() RETURNS TRIGGER AS $$
BEGIN
  IF OLD.DeviceStatus = 'Active' THEN
    RAISE EXCEPTION 'Cannot delete active devices.';
  END IF;
  RETURN OLD;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_active_device_deletion
BEFORE DELETE ON project.Devices
FOR EACH ROW EXECUTE PROCEDURE project.prevent_active_device_deletion();




DELETE FROM project.Devices
WHERE DeviceName = 'Fitbit';