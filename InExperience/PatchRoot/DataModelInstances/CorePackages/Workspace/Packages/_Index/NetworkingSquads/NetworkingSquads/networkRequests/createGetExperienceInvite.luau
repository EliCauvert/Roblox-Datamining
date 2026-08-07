local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: SQUAD_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetExperienceInvite" }, function(p1, p2) --[[ line: 9 ]]
		-- upvalues: SQUAD_URLModule (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("get-experience-invite-status"):queryArgs({
			membershipEntityId = p2.membershipEntityId,
			experienceInviteId = p2.experienceInviteId
		})
	end)
end