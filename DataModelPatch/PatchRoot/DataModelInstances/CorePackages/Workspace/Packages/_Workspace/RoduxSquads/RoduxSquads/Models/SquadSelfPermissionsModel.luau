local TModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local SquadSelfPermissionsModelModule = {}

function SquadSelfPermissionsModelModule.new(p1)
	-- upvalues: SquadSelfPermissionsModelModule (copy)
	assert(SquadSelfPermissionsModelModule.isValid(p1))
	SquadSelfPermissionsModelModule.__index = SquadSelfPermissionsModelModule
	setmetatable(p1, SquadSelfPermissionsModelModule)
	
	return p1
end

function SquadSelfPermissionsModelModule.mock(p1)
	-- upvalues: SquadSelfPermissionsModelModule (copy)
	local P1 = p1 or {}
	
	return (SquadSelfPermissionsModelModule.new({
		canSeeRegroupPromptToast = P1.canSeeRegroupPromptToast or false,
		canSeeRegroupJoinButton = P1.canSeeRegroupJoinButton or false
	}))
end

function SquadSelfPermissionsModelModule.format(p1)
	-- upvalues: SquadSelfPermissionsModelModule (copy)
	return (SquadSelfPermissionsModelModule.new({
		canSeeRegroupPromptToast = p1.canSeeRegroupPromptToast,
		canSeeRegroupJoinButton = p1.canSeeRegroupJoinButton
	}))
end

SquadSelfPermissionsModelModule.isValid = TModule.interface({
	canSeeRegroupPromptToast = TModule.boolean,
	canSeeRegroupJoinButton = TModule.boolean
})

return SquadSelfPermissionsModelModule