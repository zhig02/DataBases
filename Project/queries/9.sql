--Get the number of devices each user has

SELECT u.UserName, COUNT(ud.DeviceID)
FROM project.Users u
JOIN project.UserDevices ud ON u.UserID = ud.UserID
GROUP BY u.UserName;