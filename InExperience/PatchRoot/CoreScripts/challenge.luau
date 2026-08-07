local var0, var1 = ...
arg0 = var0
arg1 = var1

local function x1(p0, p1) --[[ line: 6 ]]
	return p0 + p1
end

local function x2(p2, p3) --[[ line: 7 ]]
	return p2 - p3
end

local function x3(p4, p5) --[[ line: 8 ]]
	return p5 - p4
end

local function x4(p6, p7) --[[ line: 9 ]]
	return tonumber(tostring(p7 % 1000) .. tostring(math.abs(p6 % 1000)))
end

local function x5(p8, p9) --[[ line: 10 ]]
	return tonumber(tostring(p9 % 1337) .. tostring(math.abs(p8 % 1337)))
end

local function x6(p10, p11) --[[ line: 11 ]]
	return p10 % 1000 * (p11 % 1000)
end

local function x7(p12, p13) --[[ line: 12 ]]
	return p12 % 1337 * (p13 % 1337)
end

local function x8(p14, p15) --[[ line: 13 ]]
	return (p14 + p15) % 1000 * ((p14 - p15) % 1000)
end

local list = {
	1, 2, 3, 4, 5, 6, 7, 8
}
local random = Random.new(5)

for _ = 1, 32 do
	local var12 = random:NextInteger(1, 8)
	local var13 = random:NextInteger(1, 8)
	local var14 = list[var12]
	list[var12] = list[var13]
	list[var13] = var14
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

return (function(p16, p17) --[[ line: 35 | named "x9" ]]
	-- upvalues: t (ref)
	local var16 = 393
	local var17 = 1
	
	for _ = 1, 16 do
		var16 = (var16 + t[math.abs(p17 + var16 + var17) % 8 + 1](var16 + p16, p17)) % 10000000
		var17 += 1
	end
	return var16
end)(arg0, arg1)