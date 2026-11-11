local function _(p1: number, p2: number, p3: number): number
	return (math.max(p2, (math.min(p3, p1))))
end

local _ = function(p1, p2, p3)
	return p1 + (p2 - p1) * p3
end

local _ = function(p1: number): number
	return 1 - (1 - p1) ^ 5
end

local _ = function(p1: number): number
	return 1 - (1 - p1) ^ 2
end

local _ = function(p1)
	return p1 * p1
end

local _ = function(p1: number): number
	return if p1 <= 0 then 0 elseif p1 < 0.15 then (1 - (1 - p1 / 0.15) ^ 2) * 1.15 + 0 elseif p1 < 0.35 then (p1 - 0.15) / 0.19999999999999998 * -0.1499999999999999 + 1.15 else 1
end

local _ = function(p1: number): number
	if p1 <= 0.55 then
		return 0
	else
		local v1 = (p1 - 0.55) / 0.44999999999999996
		
		return (math.max(0, (math.min(1, v1 * v1))))
	end
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
	solveParticle = function(p1: number, p2)
		local Largest = math.max(0, (math.min(1, p1)))
		local ScaledReach = p2.reach * (1 - (1 - Largest) ^ 5)
		local ScaledSine = math.sin(p2.angle) * ScaledReach
		local config = {
			x = math.cos(p2.angle) * ScaledReach * 1.4,
			y = ScaledSine * (if ScaledSine >= 0 then 1.5 else 0.6) + Largest * 170 * Largest,
			rotation = p2.spin * Largest,
			scale = p2.sizeScale * (if Largest <= 0 then 0 elseif Largest < 0.15 then (1 - (1 - Largest / 0.15) ^ 2) * 1.15 + 0 elseif Largest < 0.35 then (Largest - 0.15) / 0.19999999999999998 * -0.1499999999999999 + 1.15 else 1)
		}
		local Largest1 = nil
		
		if Largest <= 0.55 then
			Largest1 = 0
		else
			local LargestRatio = (Largest - 0.55) / 0.44999999999999996
			Largest1 = math.max(0, (math.min(1, LargestRatio * LargestRatio)))
		end
		config.transparency = Largest1
		
		return config
	end
}