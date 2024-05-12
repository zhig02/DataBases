--Обновление статуса устройства

CREATE OR REPLACE PROCEDURE project.update_device_status_by_name(
  p_DeviceName VARCHAR(255),
  p_DeviceStatus VARCHAR(255)
) AS $$
BEGIN
  UPDATE project.Devices
  SET DeviceStatus = p_DeviceStatus
  WHERE DeviceName = p_DeviceName;
END; $$ LANGUAGE plpgsql;

CALL project.update_device_status_by_name('Nest Thermostat', 'Inactive')