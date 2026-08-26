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
		userId = p1.userId or 1234,
		partyVoiceEligible = p1.partyVoiceEligible or false
	})
end

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({
		userId = p1.userId,
		partyVoiceEligible = p1.partyVoiceEligible
	})
end

t.isValid = tModule.interface({
	userId = tModule.number,
	partyVoiceEligible = tModule.optional(tModule.boolean)
})

return t