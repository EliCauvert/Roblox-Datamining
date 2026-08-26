local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUAD_URLModule (ref)
	return p1.roduxNetworking.POST("VoteForExperienceInvite", function(p2, p3)
		-- upvalues: SQUAD_URLModule (copy)
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("vote-for-experience-invite"):body({
			experienceInviteId = p3.experienceInviteId,
			membershipEntityId = p3.membershipEntityId,
			voteIdentifier = p3.voteIdentifier,
			voteType = p3.voteType
		})
	end)
end