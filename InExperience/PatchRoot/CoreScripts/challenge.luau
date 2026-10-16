arg0, arg1 = ...

local function x1(p1, p2) --[[ Line: 6 ]]
	return p1 + p2
end

local function x2(p1, p2) --[[ Line: 7 ]]
	return p1 - p2
end

local function x3(p1, p2) --[[ Line: 8 ]]
	return p2 - p1
end

local function x4(p1: number, p2: number): number --[[ Line: 9 ]]
	return (tonumber(tostring(p2 % 1000) .. tostring((math.abs(p1 % 1000)))))
end

local function x5(p1: number, p2: number): number --[[ Line: 10 ]]
	return (tonumber(tostring(p2 % 1337) .. tostring((math.abs(p1 % 1337)))))
end

local function x6(p1: number, p2: number): number --[[ Line: 11 ]]
	return p1 % 1000 * (p2 % 1000)
end

local function x7(p1: number, p2: number): number --[[ Line: 12 ]]
	return p1 % 1337 * (p2 % 1337)
end

local function x8(p1, p2): number --[[ Line: 13 ]]
	return (p1 + p2) % 1000 * ((p1 - p2) % 1000)
end

local list = {
	1, 2, 3, 4, 5, 6, 7, 8
}
local _Random = Random.new(5)

for _ = 1, 32 do
	local NextIntegerResult = _Random:NextInteger(1, 8)
	local NextIntegerResult1 = _Random:NextInteger(1, 8)
	local Entry = list[NextIntegerResult]
	list[NextIntegerResult] = list[NextIntegerResult1]
	list[NextIntegerResult1] = Entry
end
local config = {
	[list[1]] = x1,
	[list[2]] = x2,
	[list[3]] = x3,
	[list[4]] = x4,
	[list[5]] = x5,
	[list[6]] = x6,
	[list[7]] = x7,
	[list[8]] = x8
}

return ((function(p1: number, p2: number): number --[[ Line: 35 | Named "x9" ]]
	-- upvalues: config (copy)
	local v1 = 393
	local Count = 1
	
	for _ = 1, 16 do
		v1 = (v1 + config[math.abs(p2 + v1 + Count) % 8 + 1](v1 + p1, p2)) % 10000000
		Count += 1
	end
	return v1
end)(arg0, arg1))