local tModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		invitedAtTimestampMs = p1.invitedAtTimestampMs or 333333,
		userId = p1.userId or 11111111
	})
end

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({
		invitedAtTimestampMs = p1.invitedAtTimestampMs,
		userId = p1.userId
	})
end

t.isValid = tModule.interface({
	invitedAtTimestampMs = tModule.number,
	userId = tModule.number
})

return t