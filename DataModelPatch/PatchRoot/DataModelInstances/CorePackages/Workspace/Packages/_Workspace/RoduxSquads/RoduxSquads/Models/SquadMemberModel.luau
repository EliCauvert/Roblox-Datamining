local TModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local SquadMemberModelModule = {}

function SquadMemberModelModule.new(p1)
	-- upvalues: SquadMemberModelModule (copy)
	assert(SquadMemberModelModule.isValid(p1))
	SquadMemberModelModule.__index = SquadMemberModelModule
	setmetatable(p1, SquadMemberModelModule)
	
	return p1
end

function SquadMemberModelModule.mock(p1)
	-- upvalues: SquadMemberModelModule (copy)
	local P1 = p1 or {}
	
	return (SquadMemberModelModule.new({
		userId = P1.userId or 1234,
		partyVoiceEligible = P1.partyVoiceEligible or false
	}))
end

function SquadMemberModelModule.format(p1)
	-- upvalues: SquadMemberModelModule (copy)
	return (SquadMemberModelModule.new({
		userId = p1.userId,
		partyVoiceEligible = p1.partyVoiceEligible
	}))
end

SquadMemberModelModule.isValid = TModule.interface({
	userId = TModule.number,
	partyVoiceEligible = TModule.optional(TModule.boolean)
})

return SquadMemberModelModule