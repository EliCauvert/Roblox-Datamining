local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: SQUAD_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "SetRegroupPromptShown" }, function(p1, p2) --[[ line: 10 ]]
		-- upvalues: SQUAD_URLModule (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("set-regroup-prompt-shown"):body({ groupUpId = p2.groupUpId })
	end)
end