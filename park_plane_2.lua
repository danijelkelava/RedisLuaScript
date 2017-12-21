

local plane_id = ARGV[1]
local parking_spot = ARGV[2]

for i=1,100 do
	if redis.call("HGET", KEYS[1], i) == plane_id then
	   return plane_id.." IS ALREADY ON PARKING SPOT NO "..i
	end
end

if redis.call("HGET", KEYS[1], parking_spot) == plane_id then
   return plane_id.." IS ALREADY ON PARKING SPOT NO "..parking_spot
elseif redis.call("HGET", KEYS[1], parking_spot) == "available"  then
   redis.call("HSET", KEYS[1], parking_spot, plane_id)
   return "PLANE IS NOW PARKED ON PARKING SPOT NO "..parking_spot
end
