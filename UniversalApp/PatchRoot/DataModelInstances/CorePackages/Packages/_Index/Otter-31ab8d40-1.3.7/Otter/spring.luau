local assign = require(script.Parent.Parent.Collections).Object.assign
local _ = require(script.Parent.types)
local abs = math.abs
local exp = math.exp
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt

local function _(p1, p2, p3)
	-- upvalues: sqrt (ref)
	return p1 / (sqrt(p3 * p2) * 2), sqrt(p2 / p3) / 2 / 3.14159265359
end

return function(p1, p2)
	-- upvalues: assign (ref), sqrt (ref), exp (ref), cos (ref), sin (ref), abs (ref)
	local t = {
		dampingRatio = 1,
		frequency = 1,
		restingVelocityLimit = 0.001,
		restingPositionLimit = 0.01
	}
	
	if p2 ~= nil then
		assign(t, p2)
	end
	local dampingRatio, frequency
	local _ = nil
	local _ = nil
	local restingVelocityLimit = t.restingVelocityLimit
	local restingPositionLimit = t.restingPositionLimit
	local damping = t.damping
	local stiffness = t.stiffness
	local mass = t.mass
	
	if typeof(damping) == "number" and typeof(stiffness) == "number" and typeof(mass) == "number" then
		dampingRatio = damping / (sqrt(mass * stiffness) * 2)
		frequency = sqrt(stiffness / mass) / 2 / 3.14159265359
	else
		dampingRatio = t.dampingRatio
		frequency = t.frequency
	end
	local var1 = frequency * 2 * 3.14159265359
	assert(restingVelocityLimit >= 0, "Expected restingVelocityLimit >= 0")
	assert(restingPositionLimit >= 0, "Expected restingPositionLimit >= 0")
	
	return {
		step = function(p3, p4)
			-- upvalues: p1 (ref), dampingRatio (ref), var1 (ref), exp (copy), sqrt (copy), cos (copy), sin (copy), p1 (ref), abs (copy), restingVelocityLimit (ref), restingPositionLimit (ref)
			local var2, var3
			local velocity = p3.velocity or 0
			local var4 = p3.value - p1
			local var5 = exp(-p4 * dampingRatio * var1)
			local _ = nil
			local _ = nil
			
			if dampingRatio == 1 then
				var2 = (velocity * p4 + var4 * (var1 * p4 + 1)) * var5 + p1
				var3 = (velocity - var1 * p4 * (var4 * var1 + velocity)) * var5
			elseif dampingRatio < 1 then
				local var6
				local var7 = sqrt(1 - dampingRatio * dampingRatio)
				local var8 = cos(var1 * var7 * p4)
				local var9 = sin(var1 * var7 * p4)
				local _ = nil
				
				if var7 > 0.0001 then
					var6 = var9 / var7
				else
					local var10 = p4 * var1
					var6 = var10 + (var10 * var10 * (var7 * var7) * (var7 * var7) / 20 - var7 * var7) * (var10 * var10 * var10) / 6
				end
				local var11
				local _ = nil
				
				if var1 * var7 > 0.0001 then
					var11 = var9 / (var1 * var7)
				else
					local var12 = var1 * var7
					var11 = p4 + (p4 * p4 * (var12 * var12) * (var12 * var12) / 20 - var12 * var12) * (p4 * p4 * p4) / 6
				end
				var2 = (var4 * (var8 + dampingRatio * var6) + velocity * var11) * var5 + p1
				var3 = (velocity * (var8 - var6 * dampingRatio) - var4 * (var6 * var1)) * var5
			else
				local var13 = sqrt(dampingRatio * dampingRatio - 1)
				local var14 = -var1 * (dampingRatio - var13)
				local var15 = -var1 * (dampingRatio + var13)
				local var16 = (velocity - var14 * var4) / (2 * var1 * var13)
				local var17 = (var4 - var16) * exp(var14 * p4)
				local var18 = var16 * exp(var15 * p4)
				var2 = var17 + var18 + p1
				var3 = var14 * var17 + var15 * var18
			end
			local var19 = abs(var3) < restingVelocityLimit and abs(var2 - p1) < restingPositionLimit
			
			if var19 then
				var2 = p1
				var3 = 0
			end
			return { value = var2, velocity = var3, complete = var19 }
		end,
		startingValue = if p2 then p2.startingValue else nil
	}
end