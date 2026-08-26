local function _(value, minValue, maxValue)
	return math.max(minValue, math.min(maxValue, value))
end

local _ = function(startValue, endValue, alpha)
	return startValue + (endValue - startValue) * alpha
end

local _ = function(p1)
	return 1 - (1 - p1) ^ 5
end

local _ = function(p1)
	return 1 - (1 - p1) ^ 2
end

local _ = function(p1)
	return p1 * p1
end

local _ = function(p1)
	return if p1 <= 0 then 0 elseif p1 < 0.15 then (1 - (1 - p1 / 0.15) ^ 2) * 1.15 + 0 elseif p1 < 0.35 then (p1 - 0.15) / 0.2 * -0.15 + 1.15 else 1
end

local _ = function(p1)
	if p1 <= 0.55 then
		return 0
	end
	local var1 = (p1 - 0.55) / 0.45
	
	return math.max(0, math.min(1, var1 * var1))
end

return {
	DURATION = 0.8,
	MAX_REACH = 110,
	REACH_MIN_FACTOR = 0.7,
	REACH_RANGE = 0.3,
	GRAVITY = 170,
	X_STRETCH = 1.4,
	Y_SQUASH_UP = 0.6,
	Y_STRETCH_DOWN = 1.5,
	ANGLE_JITTER = 0.5,
	SPIN_MIN = 90,
	SPIN_RANGE = 110,
	SIZE_MIN = 0.85,
	SIZE_RANGE = 0.3,
	MIN_PARTICLES = 12,
	MAX_PARTICLES = 16,
	FADE_START = 0.55,
	OVERSHOOT = 1.15,
	solveParticle = function(p1, p2)
		local var1
		local maxValue = math.max(0, math.min(1, p1))
		local var2 = p2.reach * (1 - (1 - maxValue) ^ 5)
		local var3 = math.sin(p2.angle) * var2
		local t = {
			x = math.cos(p2.angle) * var2 * 1.4,
			y = var3 * (if var3 >= 0 then 1.5 else 0.6) + maxValue * 170 * maxValue,
			rotation = p2.spin * maxValue,
			scale = p2.sizeScale * (if maxValue <= 0 then 0 elseif maxValue < 0.15 then (1 - (1 - maxValue / 0.15) ^ 2) * 1.15 + 0 elseif maxValue < 0.35 then (maxValue - 0.15) / 0.2 * -0.15 + 1.15 else 1)
		}
		
		if maxValue <= 0.55 then
			var1 = 0
		else
			local var4 = (maxValue - 0.55) / 0.45
			var1 = math.max(0, math.min(1, var4 * var4))
		end
		t.transparency = var1
		
		return t
	end
}