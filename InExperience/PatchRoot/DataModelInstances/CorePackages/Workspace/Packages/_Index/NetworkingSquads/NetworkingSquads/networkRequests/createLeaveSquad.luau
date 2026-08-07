local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: SQUAD_URLModule (ref)
	local var1 = p0.roduxNetworking.POST({ Name = "LeaveSquad" }, function(p1, p2) --[[ line: 10 ]]
		-- upvalues: SQUAD_URLModule (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("leave"):body({ groupUpId = p2.squadId })
	end)
	
	if p0.useMockedResponse then
		var1.Mock.clear()
		var1.Mock.reply(function() --[[ line: 19 ]]
			return { responseBody = {} }
		end)
	end
	return var1
end