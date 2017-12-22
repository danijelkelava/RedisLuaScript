--STVORIMO HASH parking_spots KOJI JE NASA BAZA PODATAKA 
--KOJA SADRZI 100 PARKIRNIH MJESTA int => "available"
--NAREDBA ZA STVARANJE redis-cli --eval redis_db.lua

local PARKING_SPOT_ID = 100

for i=1, PARKING_SPOT_ID, 1 do
	redis.call("HMSET", "parking_spots", i, "available")
end