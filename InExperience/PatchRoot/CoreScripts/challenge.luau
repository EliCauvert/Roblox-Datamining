local var1, var2 = ...
arg0 = var1
arg1 = var2

local function x1(p1, p2)
	return p1 + p2
end

local function x2(p1, p2)
	return p1 - p2
end

local function x3(p1, p2)
	return p2 - p1
end

local function x4(p1, p2)
	return tonumber(tostring(p2 % 1000) .. tostring(math.abs(p1 % 1000)))
end

local function x5(p1, p2)
	return tonumber(tostring(p2 % 1337) .. tostring(math.abs(p1 % 1337)))
end

local function x6(p1, p2)
	return p1 % 1000 * (p2 % 1000)
end

local function x7(p1, p2)
	return p1 % 1337 * (p2 % 1337)
end

local function x8(p1, p2)
	return (p1 + p2) % 1000 * ((p1 - p2) % 1000)
end

local list = {
	1, 2, 3, 4, 5, 6, 7, 8
}
local random = Random.new(5)

for _ = 1, 32 do
	local var3 = random:NextInteger(1, 8)
	local var4 = random:NextInteger(1, 8)
	local var5 = list[var3]
	list[var3] = list[var4]
	list[var4] = var5
end
local t = {
	[list[1]] = x1,
	[list[2]] = x2,
	[list[3]] = x3,
	[list[4]] = x4,
	[list[5]] = x5,
	[list[6]] = x6,
	[list[7]] = x7,
	[list[8]] = x8
}

return (function(p1, p2)
	-- upvalues: t (ref)
	local var6 = 393
	local var7 = 1
	
	for _ = 1, 16 do
		var6 = (var6 + t[math.abs(p2 + var6 + var7) % 8 + 1](var6 + p1, p2)) % 10000000
		var7 += 1
	end
	return var6
end)(arg0, arg1)