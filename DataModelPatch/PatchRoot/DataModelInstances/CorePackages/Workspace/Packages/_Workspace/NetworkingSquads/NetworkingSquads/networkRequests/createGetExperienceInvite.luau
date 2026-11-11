local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	return (p1.roduxNetworking.GET({ Name = "GetExperienceInvite" }, function(Callback, p2)
		-- upvalues: SQUADURLModule (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("get-experience-invite-status"):queryArgs({
			membershipEntityId = p2.membershipEntityId,
			experienceInviteId = p2.experienceInviteId
		})
	end))
end