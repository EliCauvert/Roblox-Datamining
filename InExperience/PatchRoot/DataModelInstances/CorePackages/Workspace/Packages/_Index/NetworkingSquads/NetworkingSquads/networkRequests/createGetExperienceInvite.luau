local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUAD_URLModule (ref)
	return p1.roduxNetworking.GET("GetExperienceInvite", function(p2, p3)
		-- upvalues: SQUAD_URLModule (copy)
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("get-experience-invite-status"):queryArgs({
			membershipEntityId = p3.membershipEntityId,
			experienceInviteId = p3.experienceInviteId
		})
	end)
end