local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0)
	-- upvalues: SQUAD_URLModule (ref)
	return p0.roduxNetworking.POST("VoteForExperienceInvite", function(p1, p2)
		-- upvalues: SQUAD_URLModule (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("vote-for-experience-invite"):body({
			experienceInviteId = p2.experienceInviteId,
			membershipEntityId = p2.membershipEntityId,
			voteIdentifier = p2.voteIdentifier,
			voteType = p2.voteType
		})
	end)
end