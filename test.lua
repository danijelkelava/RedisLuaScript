--[[
local PARKING_SPOT_ID = 100
local free = {}
for i=1, PARKING_SPOT_ID, 1 do
	if redis.call("HGET", "PARKING_SPOTS", i) == "available" then
	   --redis.call("LPUSH", "free", i)
	   redis.call("HMSET", "FREE_SPOTS", "FREE_SPOT"..tostring(i), i)
    end
end
]]

local plane_id = ARGV[1]
--local plane_id = redis.call("INCR", KEYS[1])
for i=1,100 do
	if redis.call("HGET", KEYS[1], i) == plane_id then
	   return plane_id.." IS ALREADY ON PARKING SPOT NO "..i
	elseif redis.call("HGET", KEYS[1], i) == "available"  then
	   redis.call("HSET", KEYS[1], i, plane_id)
	   return i
	end
end

