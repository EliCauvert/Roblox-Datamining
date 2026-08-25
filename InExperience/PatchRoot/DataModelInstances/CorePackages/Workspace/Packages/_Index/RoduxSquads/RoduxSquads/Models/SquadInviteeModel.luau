local tModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		invitedAtTimestampMs = p1.invitedAtTimestampMs or 333333,
		userId = p1.userId or 11111111
	})
end

function t.format(p2)
	-- upvalues: t (ref)
	return t.new({
		invitedAtTimestampMs = p2.invitedAtTimestampMs,
		userId = p2.userId
	})
end

t.isValid = tModule.interface({
	invitedAtTimestampMs = tModule.number,
	userId = tModule.number
})

return t