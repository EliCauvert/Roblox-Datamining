local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0)
	-- upvalues: SQUAD_URLModule (ref)
	local var1 = nil
	local getSquadFromSquadId = p0.roduxNetworking.GET("GetSquadFromSquadId", function(p1, p2)
		-- upvalues: p0 (ref), var1 (write), SQUAD_URLModule (copy)
		if p0.useMockedResponse then
			var1 = { responseBody = { groupUp = p2.mockedSquad } }
		end
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("status"):queryArgs({ groupUpId = p2.squadId })
	end)
	
	if p0.useMockedResponse then
		getSquadFromSquadId.Mock.clear()
		getSquadFromSquadId.Mock.reply(function()
			-- upvalues: var1 (write)
			return var1
		end)
	end
	return getSquadFromSquadId
end