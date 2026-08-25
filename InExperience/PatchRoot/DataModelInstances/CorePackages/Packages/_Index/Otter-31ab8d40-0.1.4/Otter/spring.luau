local assignModule = require(script.Parent.assign)
local abs = math.abs
local exp = math.exp
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt

local function step(p0, p1, p2)
	-- upvalues: exp (ref), sqrt (ref), cos (ref), sin (ref), abs (ref)
	local var6, var7
	local dampingRatio = p0.__dampingRatio
	local var2 = p0.__frequency * 2 * 3.14159265359
	local goalPosition = p0.__goalPosition
	local restingVelocityLimit = p0.__restingVelocityLimit
	local restingPositionLimit = p0.__restingPositionLimit
	local velocity = p1.velocity or 0
	local var4 = p1.value - goalPosition
	local var5 = exp(-p2 * dampingRatio * var2)
	local _ = nil
	local _ = nil
	
	if dampingRatio == 1 then
		var6 = (velocity * p2 + var4 * (var2 * p2 + 1)) * var5 + goalPosition
		var7 = (velocity - var2 * p2 * (var4 * var2 + velocity)) * var5
	elseif dampingRatio < 1 then
		local var11
		local var8 = sqrt(1 - dampingRatio * dampingRatio)
		local var9 = cos(var2 * var8 * p2)
		local var10 = sin(var2 * var8 * p2)
		local _ = nil
		
		if var8 > 0.0001 then
			var11 = var10 / var8
		else
			local var12 = p2 * var2
			var11 = var12 + (var12 * var12 * (var8 * var8) * (var8 * var8) / 20 - var8 * var8) * (var12 * var12 * var12) / 6
		end
		local var13
		local _ = nil
		
		if var2 * var8 > 0.0001 then
			var13 = var10 / (var2 * var8)
		else
			local var14 = var2 * var8
			var13 = p2 + (p2 * p2 * (var14 * var14) * (var14 * var14) / 20 - var14 * var14) * (p2 * p2 * p2) / 6
		end
		var6 = (var4 * (var9 + dampingRatio * var11) + velocity * var13) * var5 + goalPosition
		var7 = (velocity * (var9 - var11 * dampingRatio) - var4 * (var11 * var2)) * var5
	else
		local var15 = sqrt(dampingRatio * dampingRatio - 1)
		local var16 = -var2 * (dampingRatio - var15)
		local var17 = -var2 * (dampingRatio + var15)
		local var18 = (velocity - var16 * var4) / (2 * var2 * var15)
		local var19 = (var4 - var18) * exp(var16 * p2)
		local var20 = var18 * exp(var17 * p2)
		var6 = var19 + var20 + goalPosition
		var7 = var16 * var19 + var17 * var20
	end
	local var21 = abs(var7) < restingVelocityLimit and abs(var6 - p0.__goalPosition) < restingPositionLimit
	
	if var21 then
		var6 = p0.__goalPosition
		var7 = 0
	end
	return { value = var6, velocity = var7, complete = var21 }
end

return function(p3, p4)
	-- upvalues: assignModule (ref), step (ref)
	assert(typeof(p3) == "number")
	local t = {
		dampingRatio = 1,
		frequency = 1,
		restingVelocityLimit = 0.001,
		restingPositionLimit = 0.01
	}
	
	if p4 ~= nil then
		assert(typeof(p4) == "table")
		assignModule(t, p4)
	end
	local dampingRatio = t.dampingRatio
	local frequency = t.frequency
	local restingVelocityLimit = t.restingVelocityLimit
	local restingPositionLimit = t.restingPositionLimit
	assert(typeof(dampingRatio) == "number")
	assert(typeof(frequency) == "number")
	assert(typeof(restingVelocityLimit) == "number")
	assert(typeof(restingPositionLimit) == "number")
	assert(restingVelocityLimit >= 0, "Expected restingVelocityLimit >= 0")
	assert(restingPositionLimit >= 0, "Expected restingPositionLimit >= 0")
	
	return {
		__dampingRatio = dampingRatio,
		__frequency = frequency,
		__restingVelocityLimit = restingVelocityLimit,
		__restingPositionLimit = restingPositionLimit,
		__goalPosition = p3,
		step = step
	}
end