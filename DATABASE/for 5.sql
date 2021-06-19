-- Среднее число входяищих на каждой остановке

SELECT R.Route_id, S.Stop_id, S.Name, SD.Vehicle_id, part_of_day(SD.Door_opening_time) AS Part_of_day, AVG(SD.Passengers_came_in) as Passengers
FROM a_stop AS S, sensors__data AS SD, Route_stop R
WHERE (geodist(S.Geolocation_coordinates_X, S.Geolocation_coordinates_Y, 
SD.Geolocation_coordinates_X, SD.Geolocation_coordinates_Y) <=5) AND R.Stop_id=S.Stop_id
GROUP BY  S.Stop_id, Part_of_day
