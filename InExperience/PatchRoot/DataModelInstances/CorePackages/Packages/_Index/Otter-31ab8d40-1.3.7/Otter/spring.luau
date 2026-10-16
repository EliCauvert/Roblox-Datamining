local AssignFunction = require(script.Parent.Parent.Collections).Object.assign
local _ = require(script.Parent.types)
local AbsFunction = math.abs
local ExpFunction = math.exp
local SinFunction = math.sin
local CosFunction = math.cos
local SqrtFunction = math.sqrt

local function _(p1, p2, p3) --[[ Line: 54 | Named "translateParameters" ]]
	-- upvalues: SqrtFunction (copy)
	return p1 / (SqrtFunction(p3 * p2) * 2), SqrtFunction(p2 / p3) / 2 / 3.141592653589793
end

return function(p1, p2) --[[ Line: 60 | Named "spring" ]]
	-- upvalues: AssignFunction (copy), SqrtFunction (copy), ExpFunction (copy), CosFunction (copy), SinFunction (copy), AbsFunction (copy)
	local config = {
		dampingRatio = 1,
		frequency = 1,
		restingVelocityLimit = 0.001,
		restingPositionLimit = 0.01
	}
	
	if p2 ~= nil then
		AssignFunction(config, p2)
	end
	local RestingVelocityLimit: number = config.restingVelocityLimit
	local RestingPositionLimit: number = config.restingPositionLimit
	local Damping = config.damping
	local Stiffness = config.stiffness
	local Mass = config.mass
	local Frequency = nil
	local DampingRatio = nil
	
	if typeof(Damping) == "number" and typeof(Stiffness) == "number" and typeof(Mass) == "number" then
		DampingRatio = Damping / (SqrtFunction(Mass * Stiffness) * 2)
		Frequency = SqrtFunction(Stiffness / Mass) / 2 / 3.141592653589793
	else
		DampingRatio = config.dampingRatio
		Frequency = config.frequency
	end
	local ScaledFrequency = Frequency * 2 * 3.141592653589793
	assert(RestingVelocityLimit >= 0, "Expected restingVelocityLimit >= 0")
	assert(RestingPositionLimit >= 0, "Expected restingPositionLimit >= 0")
	
	return {
		step = function(p3, p4) --[[ Line: 97 ]]
			-- upvalues: p1 (copy), DampingRatio (copy), ScaledFrequency (copy), ExpFunction (upval), SqrtFunction (upval), CosFunction (upval), SinFunction (upval), p1 (copy), AbsFunction (upval), RestingVelocityLimit (copy), RestingPositionLimit (copy)
			local Velocity = p3.velocity or 0
			local ValueDelta = p3.value - p1
			local ExpResult = ExpFunction(-p4 * DampingRatio * ScaledFrequency)
			local NewVelocity = nil
			local ScaledVelocity = nil
			
			if DampingRatio == 1 then
				NewVelocity = (Velocity * p4 + ValueDelta * (ScaledFrequency * p4 + 1)) * ExpResult + p1
				ScaledVelocity = (Velocity - ScaledFrequency * p4 * (ValueDelta * ScaledFrequency + Velocity)) * ExpResult
			elseif DampingRatio < 1 then
				local SqrtResult: number = SqrtFunction(1 - DampingRatio * DampingRatio)
				local CosResult = CosFunction(ScaledFrequency * SqrtResult * p4)
				local SinResult = SinFunction(ScaledFrequency * SqrtResult * p4)
				local SinResultRatio = nil
				
				if SqrtResult > 0.0001 then
					SinResultRatio = SinResult / SqrtResult
				else
					local ScaledScaledFrequency = p4 * ScaledFrequency
					SinResultRatio = ScaledScaledFrequency + (ScaledScaledFrequency * ScaledScaledFrequency * (SqrtResult * SqrtResult) * (SqrtResult * SqrtResult) / 20 - SqrtResult * SqrtResult) * (ScaledScaledFrequency * ScaledScaledFrequency * ScaledScaledFrequency) / 6
				end
				local SinResultRatio1 = nil
				if ScaledFrequency * SqrtResult > 0.0001 then
					SinResultRatio1 = SinResult / (ScaledFrequency * SqrtResult)
				else
					local ScaledScaledFrequency = ScaledFrequency * SqrtResult
					SinResultRatio1 = p4 + (p4 * p4 * (ScaledScaledFrequency * ScaledScaledFrequency) * (ScaledScaledFrequency * ScaledScaledFrequency) / 20 - ScaledScaledFrequency * ScaledScaledFrequency) * (p4 * p4 * p4) / 6
				end
				NewVelocity = (ValueDelta * (CosResult + DampingRatio * SinResultRatio) + Velocity * SinResultRatio1) * ExpResult + p1
				ScaledVelocity = (Velocity * (CosResult - SinResultRatio * DampingRatio) - ValueDelta * (SinResultRatio * ScaledFrequency)) * ExpResult
			else
				local SqrtResult1: number = SqrtFunction(DampingRatio * DampingRatio - 1)
				local ScaledDampingRatio = -ScaledFrequency * (DampingRatio - SqrtResult1)
				local ScaledDampingRatio1 = -ScaledFrequency * (DampingRatio + SqrtResult1)
				local VelocityRatio = (Velocity - ScaledDampingRatio * ValueDelta) / (2 * ScaledFrequency * SqrtResult1)
				local ScaledValueDelta = (ValueDelta - VelocityRatio) * ExpFunction(ScaledDampingRatio * p4)
				local ScaledVelocityRatio = VelocityRatio * ExpFunction(ScaledDampingRatio1 * p4)
				NewVelocity = ScaledValueDelta + ScaledVelocityRatio + p1
				ScaledVelocity = ScaledDampingRatio * ScaledValueDelta + ScaledDampingRatio1 * ScaledVelocityRatio
			end
			local AbsResult = AbsFunction(NewVelocity - p1)
			local IsAbsResultBelow: boolean = AbsFunction(ScaledVelocity) < RestingVelocityLimit and AbsResult < RestingPositionLimit
			
			if IsAbsResultBelow then
				NewVelocity = p1
				ScaledVelocity = 0
			end
			return {
				value = NewVelocity,
				velocity = ScaledVelocity,
				complete = IsAbsResultBelow
			}
		end,
		startingValue = if p2 then p2.startingValue else nil
	}
end