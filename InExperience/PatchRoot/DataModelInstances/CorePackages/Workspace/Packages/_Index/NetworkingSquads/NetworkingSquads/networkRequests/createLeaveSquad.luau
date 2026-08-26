local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUAD_URLModule (ref)
	local leaveSquad = p1.roduxNetworking.POST("LeaveSquad", function(p2, p3)
		-- upvalues: SQUAD_URLModule (copy)
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("leave"):body({ groupUpId = p3.squadId })
	end)
	
	if p1.useMockedResponse then
		leaveSquad.Mock.clear()
		leaveSquad.Mock.reply(function()
			return { responseBody = {} }
		end)
	end
	return leaveSquad
end