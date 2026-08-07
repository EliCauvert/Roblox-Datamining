local t = {}
t.__index = t

function t.new(p0, p1, p2, p3, p4, p5) --[[ line: 18 ]]
	-- upvalues: t (ref)
	local t_1 = {
		cancelled = false,
		phase = p3,
		currentInstance = p1,
		targetInstance = p0,
		eventName = p2,
		synthetic = p4 or false,
		eventData = if type(p5) == "table" and not table.isfrozen(p5) then table.freeze(p5) else p5
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:cancel() --[[ line: 41 ]]
	self.cancelled = true
end

return t