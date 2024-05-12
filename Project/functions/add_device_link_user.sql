--Добавление нового устройства и его привязка к пользователю. 

CREATE OR REPLACE PROCEDURE project.add_device_and_link_to_user(
  p_DeviceName VARCHAR(255),
  p_DeviceType VARCHAR(255),
  p_DeviceStatus VARCHAR(255),
  p_UserName VARCHAR(255)
) AS $$
DECLARE
  v_DeviceID INTEGER;
  v_UserID INTEGER;
BEGIN
  INSERT INTO project.Devices (DeviceName, DeviceType, DeviceStatus)
  VALUES (p_DeviceName, p_DeviceType, p_DeviceStatus)
  RETURNING DeviceID INTO v_DeviceID;

  SELECT UserID INTO v_UserID FROM project.Users WHERE UserName = p_UserName;

  INSERT INTO project.UserDevices (UserID, DeviceID)
  VALUES (v_UserID, v_DeviceID);
END; $$ LANGUAGE plpgsql;

CALL project.add_device_and_link_to_user(
    'MiBand5',
    'Wearable',
    'Active',
    'John Doe'
    )