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
		canSeeRegroupPromptToast = p1.canSeeRegroupPromptToast or false,
		canSeeRegroupJoinButton = p1.canSeeRegroupJoinButton or false
	})
end

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({
		canSeeRegroupPromptToast = p1.canSeeRegroupPromptToast,
		canSeeRegroupJoinButton = p1.canSeeRegroupJoinButton
	})
end

t.isValid = tModule.interface({
	canSeeRegroupPromptToast = tModule.boolean,
	canSeeRegroupJoinButton = tModule.boolean
})

return t