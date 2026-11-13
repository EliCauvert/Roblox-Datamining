--!native

local function _(Callback)
	return function(p1: number): number
		-- upvalues: Callback (copy)
		return 1 - Callback(1 - p1)
	end
end

local _ = function(Callback)
	return function(p1: number)
		-- upvalues: Callback (copy)
		return if p1 < 0.5 then Callback(p1 * 2) / 2 else 1 - Callback((1 - p1) * 2) / 2
	end
end

local _ = function(p1)
	return function(p2: number): number
		-- upvalues: p1 (copy)
		return p2 ^ p1
	end
end

local function inSine(p1: number): number
	return 1 - math.cos(p1 * 3.141592653589793 / 2)
end

local function inExpo(p1: number): number
	return if p1 <= 0 then 0 else 2 ^ ((p1 - 1) * 10)
end

local function inCirc(p1): number
	return 1 - math.sqrt((math.max(0, 1 - p1 * p1)))
end

local function inBack(p1: number): number
	return p1 * p1 * (p1 * 2.70158 - 1.70158)
end

local function inElastic(p1: number)
	return if p1 <= 0 then 0 elseif p1 >= 1 then 1 else -(2 ^ ((p1 - 1) * 10)) * math.sin(((p1 - 1) * 10 - 0.75) * 2.0943951023931953)
end

local function outBounce(p1: number): number
	if p1 < 0.36363636363636365 then
		return p1 * 7.5625 * p1
	elseif p1 < 0.7272727272727273 then
		local v1 = p1 - 0.5454545454545454
		
		return v1 * 7.5625 * v1 + 0.75
	elseif p1 < 0.9090909090909091 then
		local v2 = p1 - 0.8181818181818182
		
		return v2 * 7.5625 * v2 + 0.9375
	else
		local v3 = p1 - 0.9545454545454546
		
		return v3 * 7.5625 * v3 + 0.984375
	end
end

local v1 = 2

local function InQuad(p1: number): number
	-- upvalues: v1 (copy)
	return p1 ^ v1
end

local v2 = 3

local function InCubic(p1: number): number
	-- upvalues: v2 (copy)
	return p1 ^ v2
end

local v3 = 4

local function InQuart(p1: number): number
	-- upvalues: v3 (copy)
	return p1 ^ v3
end

local v4 = 5

local function InQuint(p1: number): number
	-- upvalues: v4 (copy)
	return p1 ^ v4
end

local function InBounce(p1: number): number
	-- upvalues: outBounce (copy)
	return 1 - outBounce(1 - p1)
end

return (table.freeze({
	linear = function(p1)
		return p1
	end,
	inQuad = InQuad,
	outQuad = function(p1: number): number
		-- upvalues: InQuad (copy)
		return 1 - InQuad(1 - p1)
	end,
	inOutQuad = function(p1: number)
		-- upvalues: InQuad (copy)
		return if p1 < 0.5 then InQuad(p1 * 2) / 2 else 1 - InQuad((1 - p1) * 2) / 2
	end,
	inCubic = InCubic,
	outCubic = function(p1: number): number
		-- upvalues: InCubic (copy)
		return 1 - InCubic(1 - p1)
	end,
	inOutCubic = function(p1: number)
		-- upvalues: InCubic (copy)
		return if p1 < 0.5 then InCubic(p1 * 2) / 2 else 1 - InCubic((1 - p1) * 2) / 2
	end,
	inQuart = InQuart,
	outQuart = function(p1: number): number
		-- upvalues: InQuart (copy)
		return 1 - InQuart(1 - p1)
	end,
	inOutQuart = function(p1: number)
		-- upvalues: InQuart (copy)
		return if p1 < 0.5 then InQuart(p1 * 2) / 2 else 1 - InQuart((1 - p1) * 2) / 2
	end,
	inQuint = InQuint,
	outQuint = function(p1: number): number
		-- upvalues: InQuint (copy)
		return 1 - InQuint(1 - p1)
	end,
	inOutQuint = function(p1: number)
		-- upvalues: InQuint (copy)
		return if p1 < 0.5 then InQuint(p1 * 2) / 2 else 1 - InQuint((1 - p1) * 2) / 2
	end,
	inSine = inSine,
	outSine = function(p1: number): number
		-- upvalues: inSine (copy)
		return 1 - inSine(1 - p1)
	end,
	inOutSine = function(p1: number)
		-- upvalues: inSine (copy)
		return if p1 < 0.5 then inSine(p1 * 2) / 2 else 1 - inSine((1 - p1) * 2) / 2
	end,
	inExpo = inExpo,
	outExpo = function(p1: number): number
		-- upvalues: inExpo (copy)
		return 1 - inExpo(1 - p1)
	end,
	inOutExpo = function(p1: number)
		-- upvalues: inExpo (copy)
		return if p1 < 0.5 then inExpo(p1 * 2) / 2 else 1 - inExpo((1 - p1) * 2) / 2
	end,
	inCirc = inCirc,
	outCirc = function(p1: number): number
		-- upvalues: inCirc (copy)
		return 1 - inCirc(1 - p1)
	end,
	inOutCirc = function(p1: number)
		-- upvalues: inCirc (copy)
		return if p1 < 0.5 then inCirc(p1 * 2) / 2 else 1 - inCirc((1 - p1) * 2) / 2
	end,
	inBack = inBack,
	outBack = function(p1: number): number
		-- upvalues: inBack (copy)
		return 1 - inBack(1 - p1)
	end,
	inOutBack = function(p1: number)
		-- upvalues: inBack (copy)
		return if p1 < 0.5 then inBack(p1 * 2) / 2 else 1 - inBack((1 - p1) * 2) / 2
	end,
	inElastic = inElastic,
	outElastic = function(p1: number): number
		-- upvalues: inElastic (copy)
		return 1 - inElastic(1 - p1)
	end,
	inOutElastic = function(p1: number)
		-- upvalues: inElastic (copy)
		return if p1 < 0.5 then inElastic(p1 * 2) / 2 else 1 - inElastic((1 - p1) * 2) / 2
	end,
	inBounce = InBounce,
	outBounce = outBounce,
	inOutBounce = function(p1: number)
		-- upvalues: InBounce (copy)
		return if p1 < 0.5 then InBounce(p1 * 2) / 2 else 1 - InBounce((1 - p1) * 2) / 2
	end
}))