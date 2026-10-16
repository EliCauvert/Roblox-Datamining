local TModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local SquadInviteeModelModule = {}

function SquadInviteeModelModule.new(p1) --[[ Line: 8 ]]
	-- upvalues: SquadInviteeModelModule (copy)
	assert(SquadInviteeModelModule.isValid(p1))
	SquadInviteeModelModule.__index = SquadInviteeModelModule
	setmetatable(p1, SquadInviteeModelModule)
	
	return p1
end

function SquadInviteeModelModule.mock(p1) --[[ Line: 20 ]]
	-- upvalues: SquadInviteeModelModule (copy)
	local P1 = p1 or {}
	
	return (SquadInviteeModelModule.new({
		invitedAtTimestampMs = P1.invitedAtTimestampMs or 333333,
		userId = P1.userId or 11111111
	}))
end

function SquadInviteeModelModule.format(p1) --[[ Line: 31 ]]
	-- upvalues: SquadInviteeModelModule (copy)
	return (SquadInviteeModelModule.new({
		invitedAtTimestampMs = p1.invitedAtTimestampMs,
		userId = p1.userId
	}))
end

SquadInviteeModelModule.isValid = TModule.interface({
	invitedAtTimestampMs = TModule.number,
	userId = TModule.number
})

return SquadInviteeModelModule