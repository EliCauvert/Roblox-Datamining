local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUAD_URLModule (ref)
	local var1 = nil
	local getSquadFromSquadId = p1.roduxNetworking.GET("GetSquadFromSquadId", function(p2, p3)
		-- upvalues: p1 (ref), var1 (write), SQUAD_URLModule (copy)
		if p1.useMockedResponse then
			var1 = { responseBody = { groupUp = p3.mockedSquad } }
		end
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("status"):queryArgs({ groupUpId = p3.squadId })
	end)
	
	if p1.useMockedResponse then
		getSquadFromSquadId.Mock.clear()
		getSquadFromSquadId.Mock.reply(function()
			-- upvalues: var1 (write)
			return var1
		end)
	end
	return getSquadFromSquadId
end