local tModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local t = {}

function t.new(p0) --[[ line: 8 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 20 ]]
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		userId = p1.userId or 1234,
		partyVoiceEligible = p1.partyVoiceEligible or false
	})
end

function t.format(p2) --[[ line: 31 ]]
	-- upvalues: t (ref)
	return t.new({
		userId = p2.userId,
		partyVoiceEligible = p2.partyVoiceEligible
	})
end

t.isValid = tModule.interface({
	userId = tModule.number,
	partyVoiceEligible = tModule.optional(tModule.boolean)
})

return t