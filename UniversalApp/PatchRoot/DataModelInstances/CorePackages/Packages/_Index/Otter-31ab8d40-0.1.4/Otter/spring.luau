local AssignModule = require(script.Parent.assign)
local AbsFunction = math.abs
local ExpFunction = math.exp
local SinFunction = math.sin
local CosFunction = math.cos
local SqrtFunction = math.sqrt

local function step(p1, p2, p3) --[[ Line: 20 ]]
	-- upvalues: ExpFunction (copy), SqrtFunction (copy), CosFunction (copy), SinFunction (copy), AbsFunction (copy)
	local DampingRatio: number = p1.__dampingRatio
	local ScaledFrequency = p1.__frequency * 2 * 3.141592653589793
	local GoalPosition = p1.__goalPosition
	local RestingVelocityLimit = p1.__restingVelocityLimit
	local RestingPositionLimit = p1.__restingPositionLimit
	local Velocity = p2.velocity or 0
	local ValueDelta = p2.value - GoalPosition
	local ExpResult = ExpFunction(-p3 * DampingRatio * ScaledFrequency)
	local ScaledVelocity = nil
	local NewVelocity = nil
	
	if DampingRatio == 1 then
		NewVelocity = (Velocity * p3 + ValueDelta * (ScaledFrequency * p3 + 1)) * ExpResult + GoalPosition
		ScaledVelocity = (Velocity - ScaledFrequency * p3 * (ValueDelta * ScaledFrequency + Velocity)) * ExpResult
	elseif DampingRatio < 1 then
		local SqrtResult: number = SqrtFunction(1 - DampingRatio * DampingRatio)
		local CosResult = CosFunction(ScaledFrequency * SqrtResult * p3)
		local SinResult = SinFunction(ScaledFrequency * SqrtResult * p3)
		local SinResultRatio = nil
		
		if SqrtResult > 0.0001 then
			SinResultRatio = SinResult / SqrtResult
		else
			local ScaledScaledFrequency = p3 * ScaledFrequency
			SinResultRatio = ScaledScaledFrequency + (ScaledScaledFrequency * ScaledScaledFrequency * (SqrtResult * SqrtResult) * (SqrtResult * SqrtResult) / 20 - SqrtResult * SqrtResult) * (ScaledScaledFrequency * ScaledScaledFrequency * ScaledScaledFrequency) / 6
		end
		local SinResultRatio1 = nil
		if ScaledFrequency * SqrtResult > 0.0001 then
			SinResultRatio1 = SinResult / (ScaledFrequency * SqrtResult)
		else
			local ScaledScaledFrequency = ScaledFrequency * SqrtResult
			SinResultRatio1 = p3 + (p3 * p3 * (ScaledScaledFrequency * ScaledScaledFrequency) * (ScaledScaledFrequency * ScaledScaledFrequency) / 20 - ScaledScaledFrequency * ScaledScaledFrequency) * (p3 * p3 * p3) / 6
		end
		NewVelocity = (ValueDelta * (CosResult + DampingRatio * SinResultRatio) + Velocity * SinResultRatio1) * ExpResult + GoalPosition
		ScaledVelocity = (Velocity * (CosResult - SinResultRatio * DampingRatio) - ValueDelta * (SinResultRatio * ScaledFrequency)) * ExpResult
	else
		local SqrtResult1: number = SqrtFunction(DampingRatio * DampingRatio - 1)
		local ScaledDampingRatio = -ScaledFrequency * (DampingRatio - SqrtResult1)
		local ScaledDampingRatio1 = -ScaledFrequency * (DampingRatio + SqrtResult1)
		local VelocityRatio = (Velocity - ScaledDampingRatio * ValueDelta) / (2 * ScaledFrequency * SqrtResult1)
		local ScaledValueDelta = (ValueDelta - VelocityRatio) * ExpFunction(ScaledDampingRatio * p3)
		local ScaledVelocityRatio = VelocityRatio * ExpFunction(ScaledDampingRatio1 * p3)
		NewVelocity = ScaledValueDelta + ScaledVelocityRatio + GoalPosition
		ScaledVelocity = ScaledDampingRatio * ScaledValueDelta + ScaledDampingRatio1 * ScaledVelocityRatio
	end
	local AbsResult = AbsFunction(NewVelocity - p1.__goalPosition)
	local IsRestingPositionLimitAbove: boolean = AbsFunction(ScaledVelocity) < RestingVelocityLimit and RestingPositionLimit > AbsResult
	
	if IsRestingPositionLimitAbove then
		NewVelocity = p1.__goalPosition
		ScaledVelocity = 0
	end
	return {
		value = NewVelocity,
		velocity = ScaledVelocity,
		complete = IsRestingPositionLimitAbove
	}
end

return function(p1, p2) --[[ Line: 117 | Named "spring" ]]
	-- upvalues: AssignModule (copy), step (copy)
	assert(typeof(p1) == "number")
	local config = {
		dampingRatio = 1,
		frequency = 1,
		restingVelocityLimit = 0.001,
		restingPositionLimit = 0.01
	}
	
	if p2 ~= nil then
		assert(typeof(p2) == "table")
		AssignModule(config, p2)
	end
	local DampingRatio = config.dampingRatio
	local Frequency = config.frequency
	local RestingVelocityLimit: number = config.restingVelocityLimit
	local RestingPositionLimit: number = config.restingPositionLimit
	assert(typeof(DampingRatio) == "number")
	assert(typeof(Frequency) == "number")
	assert(typeof(RestingVelocityLimit) == "number")
	assert(typeof(RestingPositionLimit) == "number")
	assert(RestingVelocityLimit >= 0, "Expected restingVelocityLimit >= 0")
	assert(RestingPositionLimit >= 0, "Expected restingPositionLimit >= 0")
	
	return {
		__dampingRatio = DampingRatio,
		__frequency = Frequency,
		__restingVelocityLimit = RestingVelocityLimit,
		__restingPositionLimit = RestingPositionLimit,
		__goalPosition = p1,
		step = step
	}
end