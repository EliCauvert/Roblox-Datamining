local Frozen = table.freeze({
	jumpDistance = 1e999,
	frequency = 2.5,
	approachDistance = 1,
	landingDistance = 1
})

local function _(p1, Value: number, p2): boolean
	return p1 * p2 < math.abs(Value)
end

local _ = function(p1: number, p2, p3, p4)
	assert(p1 == nil or type(p1) == "number" and p1 > 0 and (p4 or p1 < 1e999), `{p3}: {p2} must be a positive number`)
end

local _ = function(p1: number, p2, p3)
	assert(p1 == nil or type(p1) == "number" and p1 >= 0 and p1 < 1e999, `{p3}: {p2} must be a finite non-negative number`)
end

local config = {
	defaults = Frozen,
	isAtRest = function(p1, p2, Value: number): boolean
		return math.abs(p2 - p1) < 0.5 and math.abs(Value) < 10
	end,
	validate = function(p1, p2)
		if p1 ~= nil then
			local JumpDistance: number = p1.jumpDistance
			assert(JumpDistance == nil or type(JumpDistance) == "number" and JumpDistance > 0, `{p2}: jumpDistance must be a positive number`)
			local Frequency: number = p1.frequency
			assert(Frequency == nil or type(Frequency) == "number" and Frequency > 0 and Frequency < 1e999, `{p2}: frequency must be a positive number`)
			local CruiseSpeed: number = p1.cruiseSpeed
			assert(CruiseSpeed == nil or type(CruiseSpeed) == "number" and CruiseSpeed > 0 and CruiseSpeed < 1e999, `{p2}: cruiseSpeed must be a positive number`)
			local ApproachDistance: number = p1.approachDistance
			assert(ApproachDistance == nil or type(ApproachDistance) == "number" and ApproachDistance >= 0 and ApproachDistance < 1e999, `{p2}: approachDistance must be a finite non-negative number`)
			local LandingDistance: number = p1.landingDistance
			assert(LandingDistance == nil or type(LandingDistance) == "number" and LandingDistance >= 0 and LandingDistance < 1e999, `{p2}: landingDistance must be a finite non-negative number`)
			
			return
		end
	end,
	resolve = function(p1, p2)
		-- upvalues: Frozen (copy)
		local P13 = p1 or {}
		local P14 = p2 or {}
		local Frequency = P13.frequency or (P14.frequency or 2.5)
		
		return (table.freeze({
			jumpDistance = P13.jumpDistance or (P14.jumpDistance or Frozen.jumpDistance),
			frequency = Frequency,
			approachDistance = P13.approachDistance or (P14.approachDistance or Frozen.approachDistance),
			cruiseSpeed = P13.cruiseSpeed or (P14.cruiseSpeed or 6.283185307179586 * Frequency),
			landingDistance = P13.landingDistance or (P14.landingDistance or Frozen.landingDistance)
		}))
	end,
	start = function(p1, p2, p3, Velocity, Profile)
		local IsJumpDistanceBelow = Profile.jumpDistance * p3 < math.abs(p2 - p1)
		
		return {
			approached = 0,
			phase = if IsJumpDistanceBelow then "approach" else "land",
			velocity = Velocity,
			profile = Profile,
			angularFrequency = 6.283185307179586 * Profile.frequency
		}
	end
}

local _ = function(p1, p2, p3, p4)
	local AngularFrequency = p1.angularFrequency
	local v1 = p2 - p3
	local Velocity = p1.velocity
	local NewVelocity = Velocity + AngularFrequency * v1
	local Exponential = math.exp(-AngularFrequency * p4)
	p1.velocity = (Velocity - AngularFrequency * NewVelocity * p4) * Exponential
	
	return p3 + (v1 + NewVelocity * p4) * Exponential
end

local _ = function(p1, p2: number, p3, p4, p5): number
	local AngularFrequency: number = p1.angularFrequency
	local ScaledCruiseSpeed = p3 * p1.profile.cruiseSpeed * p4
	local Velocity = p1.velocity
	local Exponential = math.exp(AngularFrequency * -2 * p5)
	p1.velocity = ScaledCruiseSpeed + (Velocity - ScaledCruiseSpeed) * Exponential
	local Value = ScaledCruiseSpeed * p5 + (Velocity - ScaledCruiseSpeed) * (1 - Exponential) / (AngularFrequency * 2)
	p1.approached += math.abs(Value)
	
	return p2 + Value
end

function config.step(p1, p2: number, p3: number, p4, p5: number)
	-- upvalues: config (copy)
	assert(p5 >= 0 and p5 < 1e999, "ScrollMotion: dt must be a finite non-negative number")
	local Value = p3 - p2
	local Profile = p1.profile
	
	if p1.phase == "approach" then
		if math.abs(Value) > Profile.jumpDistance * p4 then
			if Profile.approachDistance * p4 > p1.approached then
				local AngularFrequency: number = p1.angularFrequency
				local ScaledSign = math.sign(Value) * p1.profile.cruiseSpeed * p4
				local Velocity = p1.velocity
				local Exponential = math.exp(AngularFrequency * -2 * p5)
				p1.velocity = ScaledSign + (Velocity - ScaledSign) * Exponential
				local Value1 = ScaledSign * p5 + (Velocity - ScaledSign) * (1 - Exponential) / (AngularFrequency * 2)
				p1.approached += math.abs(Value1)
				
				return p2 + Value1, false
			end
			p2 = p3 - math.sign(Value) * math.min(math.abs(Value), (math.max(Profile.landingDistance * p4, math.abs(p1.velocity) / p1.angularFrequency)))
			p1.phase = "land"
		else
			p1.phase = "land"
		end
	end
	local AngularFrequency = p1.angularFrequency
	local v1 = p2 - p3
	local Velocity = p1.velocity
	local NewVelocity = Velocity + AngularFrequency * v1
	local Exponential = math.exp(-AngularFrequency * p5)
	p1.velocity = (Velocity - AngularFrequency * NewVelocity * p5) * Exponential
	local NewNewVelocity = p3 + (v1 + NewVelocity * p5) * Exponential
	
	if config.isAtRest(NewNewVelocity, p3, p1.velocity) then
		p1.velocity = 0
		
		return p3, true
	else
		return NewNewVelocity, false
	end
end

return table.freeze(config)