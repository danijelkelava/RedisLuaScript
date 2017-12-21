
local PARKING_SPOT_ID = 100

for i=1, PARKING_SPOT_ID, 1 do
	redis.call("HMSET", "parking_spots", i, "available")
end