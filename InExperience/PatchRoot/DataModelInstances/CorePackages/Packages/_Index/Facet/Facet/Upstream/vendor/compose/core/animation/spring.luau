--!native

local _ = require("../types")

local function advance(State, p1, p2: number, p3, p4): number
	if p2 <= 0 then
		return 0
	end
	local Smallest = math.min(p2, 0.25)
	local Position = State.position
	local Velocity = State.velocity
	local Arity = State.arity
	local Smallest1: number = Smallest
	while Smallest1 > 0 do
		local Smallest2 = if Smallest1 > 0.008333333333333333 then 0.008333333333333333 else Smallest1
		Smallest1 -= Smallest2
		
		for i = 1, Arity do
			local NewVelocityEntry = Velocity[i] + (-p3 * (Position[i] - p1[i]) - p4 * Velocity[i]) * Smallest2
			Velocity[i] = NewVelocityEntry
			Position[i] += NewVelocityEntry * Smallest2
		end
	end
	return Smallest
end

return {
	createState = function(p5, Arity)
		local Buffer = table.create(Arity, 0)
		local Buffer1 = table.create(Arity, 0)
		
		for i = 1, Arity do
			Buffer[i] = p5[i]
			Buffer1[i] = 0
		end
		return { position = Buffer, velocity = Buffer1, arity = Arity }
	end,
	coefficients = function(p6: number, p7: number)
		local v1 = 6.283185307179586 / p6
		
		return v1 * v1, p7 * 2 * v1
	end,
	step = function(p6, p7, p8: number, p9: number, p10: number)
		-- upvalues: advance (copy)
		if p8 <= 0 then
			return 0
		else
			local v1 = 6.283185307179586 / p9
			
			return (advance(p6, p7, p8, v1 * v1, p10 * 2 * v1))
		end
	end,
	advance = advance,
	atRest = function(State, p6, p7, p8: number): boolean
		local Position = State.position
		local Velocity = State.velocity
		
		for i = 1, State.arity do
			local Largest = math.max(math.abs(p7[i] - p6[i]) * p8, p8)
			
			if Largest < math.abs(Position[i] - p6[i]) then
				return false
			elseif Largest >= math.abs(Velocity[i]) * 0.008333333333333333 then
				continue
			else
				return false
			end
		end
		return true
	end,
	settle = function(State, p9)
		local Position = State.position
		local Velocity = State.velocity
		
		for i = 1, State.arity do
			Position[i] = p9[i]
			Velocity[i] = 0
		end
	end
}