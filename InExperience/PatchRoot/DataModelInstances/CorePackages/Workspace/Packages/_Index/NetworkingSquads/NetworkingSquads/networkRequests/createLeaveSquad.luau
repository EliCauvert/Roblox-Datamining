local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0)
	-- upvalues: SQUAD_URLModule (ref)
	local leaveSquad = p0.roduxNetworking.POST("LeaveSquad", function(p1, p2)
		-- upvalues: SQUAD_URLModule (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("leave"):body({ groupUpId = p2.squadId })
	end)
	
	if p0.useMockedResponse then
		leaveSquad.Mock.clear()
		leaveSquad.Mock.reply(function()
			return { responseBody = {} }
		end)
	end
	return leaveSquad
end