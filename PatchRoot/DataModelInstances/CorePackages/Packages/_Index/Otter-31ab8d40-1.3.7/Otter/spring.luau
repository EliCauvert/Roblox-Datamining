-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local assign = require(script.Parent.Parent.Collections).Object.assign
local _ = require(script.Parent.types)
local abs = math.abs
local exp = math.exp
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt

local function _(p0, p1, p2) --[[ line: 54 | named "translateParameters" ]]
	-- upvalues: sqrt (ref)
	return p0 / (sqrt(p2 * p1) * 2), sqrt(p1 / p2) / 2 / 3.14159265359
end

return function(p3, p4) --[[ line: 60 | named "spring" ]]
	-- upvalues: assign (ref), sqrt (ref), exp (ref), cos (ref), sin (ref), abs (ref)
	local t = {
		dampingRatio = 1,
		frequency = 1,
		restingVelocityLimit = 0.001,
		restingPositionLimit = 0.01
	}
	
	if p4 ~= nil then
		assign(t, p4)
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
		step = function(p5, p6) --[[ line: 97 ]]
			-- upvalues: p3 (ref), dampingRatio (ref), var1 (ref), exp (copy), sqrt (copy), cos (copy), sin (copy), p3 (ref), abs (copy), restingVelocityLimit (ref), restingPositionLimit (ref)
			local var5, var6
			local velocity = p5.velocity or 0
			local var3 = p5.value - p3
			local var4 = exp(-p6 * dampingRatio * var1)
			local _ = nil
			local _ = nil
			
			if dampingRatio == 1 then
				var5 = (velocity * p6 + var3 * (var1 * p6 + 1)) * var4 + p3
				var6 = (velocity - var1 * p6 * (var3 * var1 + velocity)) * var4
			elseif dampingRatio < 1 then
				local var10
				local var7 = sqrt(1 - dampingRatio * dampingRatio)
				local var8 = cos(var1 * var7 * p6)
				local var9 = sin(var1 * var7 * p6)
				local _ = nil
				
				if var7 > 0.0001 then
					var10 = var9 / var7
				else
					local var11 = p6 * var1
					var10 = var11 + (var11 * var11 * (var7 * var7) * (var7 * var7) / 20 - var7 * var7) * (var11 * var11 * var11) / 6
				end
				local var12
				local _ = nil
				
				if var1 * var7 > 0.0001 then
					var12 = var9 / (var1 * var7)
				else
					local var13 = var1 * var7
					var12 = p6 + (p6 * p6 * (var13 * var13) * (var13 * var13) / 20 - var13 * var13) * (p6 * p6 * p6) / 6
				end
				var5 = (var3 * (var8 + dampingRatio * var10) + velocity * var12) * var4 + p3
				var6 = (velocity * (var8 - var10 * dampingRatio) - var3 * (var10 * var1)) * var4
			else
				local var14 = sqrt(dampingRatio * dampingRatio - 1)
				local var15 = -var1 * (dampingRatio - var14)
				local var16 = -var1 * (dampingRatio + var14)
				local var17 = (velocity - var15 * var3) / (2 * var1 * var14)
				local var18 = (var3 - var17) * exp(var15 * p6)
				local var19 = var17 * exp(var16 * p6)
				var5 = var18 + var19 + p3
				var6 = var15 * var18 + var16 * var19
			end
			local var20 = abs(var6) < restingVelocityLimit and abs(var5 - p3) < restingPositionLimit
			
			if var20 then
				var5 = p3
				var6 = 0
			end
			return { value = var5, velocity = var6, complete = var20 }
		end,
		startingValue = if p4 then p4.startingValue else nil
	}
end