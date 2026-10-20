local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	return (p1.roduxNetworking.POST({ Name = "VoteForExperienceInvite" }, function(Callback, p2)
		-- upvalues: SQUADURLModule (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("vote-for-experience-invite"):body({
			experienceInviteId = p2.experienceInviteId,
			membershipEntityId = p2.membershipEntityId,
			voteIdentifier = p2.voteIdentifier,
			voteType = p2.voteType
		})
	end))
end