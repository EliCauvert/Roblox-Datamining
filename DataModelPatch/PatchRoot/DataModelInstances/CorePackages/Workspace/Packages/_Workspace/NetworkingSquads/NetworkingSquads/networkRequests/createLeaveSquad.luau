local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	local LeaveSquad = p1.roduxNetworking.POST({ Name = "LeaveSquad" }, function(Callback, p2)
		-- upvalues: SQUADURLModule (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("leave"):body({ groupUpId = p2.squadId })
	end)
	
	if p1.useMockedResponse then
		LeaveSquad.Mock.clear()
		LeaveSquad.Mock.reply(function()
			return { responseBody = {} }
		end)
	end
	return LeaveSquad
end