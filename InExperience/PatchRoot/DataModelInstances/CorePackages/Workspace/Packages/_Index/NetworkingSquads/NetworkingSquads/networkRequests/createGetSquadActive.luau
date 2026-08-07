local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: SQUAD_URLModule (ref)
	local var1 = nil
	local var2 = p0.roduxNetworking.GET({ Name = "GetSquadActive" }, function(p1, p2) --[[ line: 11 ]]
		-- upvalues: p0 (ref), var1 (write), SQUAD_URLModule (copy)
		if p0.useMockedResponse then
			var1 = { responseBody = { groupUp = p2.mockedSquad } }
		end
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("active-status")
	end)
	
	if p0.useMockedResponse then
		var2.Mock.clear()
		var2.Mock.reply(function() --[[ line: 26 ]]
			-- upvalues: var1 (write)
			return var1
		end)
	end
	return var2
end