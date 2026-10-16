local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: SQUADURLModule (copy)
	local LeaveSquad = p1.roduxNetworking.POST("LeaveSquad", function(Callback, p2) --[[ Line: 10 ]]
		-- upvalues: SQUADURLModule (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("leave"):body({ groupUpId = p2.squadId })
	end)
	
	if p1.useMockedResponse then
		LeaveSquad.Mock.clear()
		LeaveSquad.Mock.reply(function() --[[ Line: 19 ]]
			return { responseBody = {} }
		end)
	end
	return LeaveSquad
end