local ExpFunction = math.exp
local SpringModule = {}
SpringModule.__index = SpringModule

function SpringModule.new(p1, p2: number)
	-- upvalues: SpringModule (copy)
	local self = setmetatable({}, SpringModule)
	self.f = p1
	self.p = p2
	self.v = p2 * 0
	
	return self
end

function SpringModule:update(p1, p2)
	-- upvalues: ExpFunction (copy)
	local ScaledF = self.f * 2 * 3.141592653589793
	local V = self.v
	local v1 = p2 - self.p
	local ExpResult = ExpFunction(-ScaledF * p1)
	local NewV = p2 + (V * p1 - v1 * (ScaledF * p1 + 1)) * ExpResult
	self.p = NewV
	self.v = (ScaledF * p1 * (v1 * ScaledF - V) + V) * ExpResult
	
	return NewV
end

function SpringModule:reset(p1: number)
	self.p = p1
	self.v = p1 * 0
end

return SpringModule