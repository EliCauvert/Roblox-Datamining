local t = {}
t.__index = t

function t.new(p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref)
	local t_1 = {
		cancelled = false,
		phase = p4,
		currentInstance = p2,
		targetInstance = p1,
		eventName = p3,
		synthetic = p5 or false,
		eventData = if type(p6) == "table" and not table.isfrozen(p6) then table.freeze(p6) else p6
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:cancel()
	self.cancelled = true
end

return t