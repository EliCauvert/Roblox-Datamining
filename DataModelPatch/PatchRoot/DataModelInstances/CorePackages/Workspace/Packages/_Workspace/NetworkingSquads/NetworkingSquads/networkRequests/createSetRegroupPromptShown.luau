local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	return (p1.roduxNetworking.POST({ Name = "SetRegroupPromptShown" }, function(Callback, p2)
		-- upvalues: SQUADURLModule (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("set-regroup-prompt-shown"):body({ groupUpId = p2.groupUpId })
	end))
end