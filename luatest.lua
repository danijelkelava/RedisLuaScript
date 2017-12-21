print("hello world")

--komantari
--[[visenijiski komentari
jeeeeeee
]]



name = 4

io.write("Size of string ", name, "\n")

bigNum = 45566767

io.write("Big number ", type(bigNum), "\n")
-- ~= isto ko != u php
age = 32

if age > 34 then
	io.write("hej ho", "\n")
	local localVar = 10 --lokalna varijabla dosupupna samo u if else bloku
elseif (age < 34) and (age > 20) then
	io.write("heeeeeej", "\n")
else
    io.write("frhzjj", "\n")
end

canVote = age > 18 and true or false --slicno ternary operatoru, zapravo radi isto, ali ovako se pise
io.write("can i vote: ", tostring(canVote), "\n")

i = 1
while (i <= 10) do
  io.write(i)
  i = i + 1

  -- break throws you out of a loop
  -- continue doesn't exist with Lua
  if i == 8 then break end
end
print("\n")

for i = 1, 10, 1.3 do
  io.write(i.." ")
end
print("\n")

-- Create a table which is a list of items like an array
months = {"January", "February", "March", "April", "May",
"June", "July", "August", "September", "October", "November",
"December"}

-- Cycle through table where k is the key and v the value of each item
for k, v in pairs(months) do
  io.write(v, " ")
end
print("\n")
