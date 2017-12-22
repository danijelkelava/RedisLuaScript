
--SKRIPTA KOJA PARKIRA AVION NA PRVO RASPOLOZIVO PARKIRNO MJESTO
--NARAVNO, PRIJE PROVJERI POSTOJI LI VEC plane_id, JER ZELIMO JEDINSTVEN plane_id
--NAREDBA ZA PARKIRANJE redis-cli --eval park_plane2.lua parking_spots, plane_id 

local plane_id = ARGV[1]

for i=1,100 do
  if redis.call("HGET", KEYS[1], i) == plane_id then
     return plane_id.." IS ALREADY ON PARKING SPOT NO "..i
  elseif redis.call("HGET", KEYS[1], i) == "available"  then
	   redis.call("HSET", KEYS[1], i, plane_id)
	   return plane_id.." IS NOW PARKED ON PARKING SPOT NO "..i
  end
end




