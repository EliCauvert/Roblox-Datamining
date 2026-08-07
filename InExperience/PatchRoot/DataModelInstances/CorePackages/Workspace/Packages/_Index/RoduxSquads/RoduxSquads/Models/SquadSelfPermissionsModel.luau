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
		canSeeRegroupPromptToast = p1.canSeeRegroupPromptToast or false,
		canSeeRegroupJoinButton = p1.canSeeRegroupJoinButton or false
	})
end

function t.format(p2) --[[ line: 31 ]]
	-- upvalues: t (ref)
	return t.new({
		canSeeRegroupPromptToast = p2.canSeeRegroupPromptToast,
		canSeeRegroupJoinButton = p2.canSeeRegroupJoinButton
	})
end

t.isValid = tModule.interface({
	canSeeRegroupPromptToast = tModule.boolean,
	canSeeRegroupJoinButton = tModule.boolean
})

return t