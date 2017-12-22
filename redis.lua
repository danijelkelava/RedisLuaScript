
local ps_id = 100

local parking_spots = {}

for i=1,ps_id do
	parking_spots[i] = "free"..tostring(i)
	print(parking_spots[i])
end

math.randomseed(os.time())
math.random(); math.random(); math.random()
number = math.random(1, 100)
print(number)

local function addPlane(plane_id)
	parking_spots[number] = plane_id
end

 addPlane("P5")

--io.write("parking_spot: ", parking_spots[23])


for k,v in pairs(parking_spots) do
	print(k,v)
end

redis-cli --eval redis_db.lua
redis-cli --eval park_plane_2.lua parking_spots , dc 1
redis-cli --eval park_plane.lua

cd Lua