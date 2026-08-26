local assignModule = require(script.Parent.assign)
local abs = math.abs
local exp = math.exp
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt

local function step(p1, p2, p3)
	-- upvalues: exp (ref), sqrt (ref), cos (ref), sin (ref), abs (ref)
	local var1, var2
	local dampingRatio = p1.__dampingRatio
	local var3 = p1.__frequency * 2 * 3.14159265359
	local goalPosition = p1.__goalPosition
	local restingVelocityLimit = p1.__restingVelocityLimit
	local restingPositionLimit = p1.__restingPositionLimit
	local velocity = p2.velocity or 0
	local var4 = p2.value - goalPosition
	local var5 = exp(-p3 * dampingRatio * var3)
	local _ = nil
	local _ = nil
	
	if dampingRatio == 1 then
		var1 = (velocity * p3 + var4 * (var3 * p3 + 1)) * var5 + goalPosition
		var2 = (velocity - var3 * p3 * (var4 * var3 + velocity)) * var5
	elseif dampingRatio < 1 then
		local var6
		local var7 = sqrt(1 - dampingRatio * dampingRatio)
		local var8 = cos(var3 * var7 * p3)
		local var9 = sin(var3 * var7 * p3)
		local _ = nil
		
		if var7 > 0.0001 then
			var6 = var9 / var7
		else
			local var10 = p3 * var3
			var6 = var10 + (var10 * var10 * (var7 * var7) * (var7 * var7) / 20 - var7 * var7) * (var10 * var10 * var10) / 6
		end
		local var11
		local _ = nil
		
		if var3 * var7 > 0.0001 then
			var11 = var9 / (var3 * var7)
		else
			local var12 = var3 * var7
			var11 = p3 + (p3 * p3 * (var12 * var12) * (var12 * var12) / 20 - var12 * var12) * (p3 * p3 * p3) / 6
		end
		var1 = (var4 * (var8 + dampingRatio * var6) + velocity * var11) * var5 + goalPosition
		var2 = (velocity * (var8 - var6 * dampingRatio) - var4 * (var6 * var3)) * var5
	else
		local var13 = sqrt(dampingRatio * dampingRatio - 1)
		local var14 = -var3 * (dampingRatio - var13)
		local var15 = -var3 * (dampingRatio + var13)
		local var16 = (velocity - var14 * var4) / (2 * var3 * var13)
		local var17 = (var4 - var16) * exp(var14 * p3)
		local var18 = var16 * exp(var15 * p3)
		var1 = var17 + var18 + goalPosition
		var2 = var14 * var17 + var15 * var18
	end
	local var19 = abs(var2) < restingVelocityLimit and abs(var1 - p1.__goalPosition) < restingPositionLimit
	
	if var19 then
		var1 = p1.__goalPosition
		var2 = 0
	end
	return { value = var1, velocity = var2, complete = var19 }
end

return function(p1, p2)
	-- upvalues: assignModule (ref), step (ref)
	assert(typeof(p1) == "number")
	local t = {
		dampingRatio = 1,
		frequency = 1,
		restingVelocityLimit = 0.001,
		restingPositionLimit = 0.01
	}
	
	if p2 ~= nil then
		assert(typeof(p2) == "table")
		assignModule(t, p2)
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
		__goalPosition = p1,
		step = step
	}
end