

local function parkPlane(i, plane_id)
    if redis.call("HGET", "PARKING_SPOTS", i) == "available" then
       redis.call("HMSET", "PARKING_SPOTS", i, plane_id)
       return i      
    end
       return i.." IS TAKEN"
end


local PARKING_SPOT_ID = 100
local plane_id = ARGV[1]

for i=1, PARKING_SPOT_ID, 1 do
	if redis.call("HGET", "PARKING_SPOTS", i) == plane_id then
		return i.." is taken by "..plane_id
	elseif redis.call("HGET", "PARKING_SPOTS", i) == "available"  then
	   redis.call("HSET", "PARKING_SPOTS", i, plane_id)
	   return i
    end
end
--local plane_id = ARGV[1]



