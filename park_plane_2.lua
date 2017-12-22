
--OVA SKRIPTA NAJPRIJE PROVJER POSTOJI LI VEC plane_id U NASOJ BAZI 
--JER ZELIMO DA plane_id BUDE JEDINSTVEN. AKO POSTOJI, VRATI NAM PARKIRNO MJESTO AVIONA
--AKO NE POSTOJI, DODIJELI MU PARKIRNO MJESTO PO BROJU KOJEG DAMO KAO ARGUMENT U NASOJ NAREDBI
--PA OPET VRATI BROJ PARKIRNOG MJESTA

local plane_id = ARGV[1]
local parking_spot = ARGV[2]

for i=1,100 do
	if redis.call("HGET", KEYS[1], i) == plane_id then
	   return plane_id.." IS ALREADY ON PARKING SPOT NO "..i
	end
end

if redis.call("HGET", KEYS[1], parking_spot) == "available"  then
   redis.call("HSET", KEYS[1], parking_spot, plane_id)
   return "PLANE IS NOW PARKED ON PARKING SPOT NO "..parking_spot
else
	return "PARKING SPOT IS UNAVAILABLE OR UNEXISTING!!!"
end
