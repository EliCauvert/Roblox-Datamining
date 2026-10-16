local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: SQUADURLModule (copy)
	local Config = nil
	local GetSquadFromSquadId = p1.roduxNetworking.GET("GetSquadFromSquadId", function(Callback, p2) --[[ Line: 11 ]]
		-- upvalues: p1 (copy), Config (ref), SQUADURLModule (upval)
		if p1.useMockedResponse then
			Config = { responseBody = { groupUp = p2.mockedSquad } }
		end
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("status"):queryArgs({ groupUpId = p2.squadId })
	end)
	
	if p1.useMockedResponse then
		GetSquadFromSquadId.Mock.clear()
		GetSquadFromSquadId.Mock.reply(function() --[[ Line: 28 ]]
			-- upvalues: Config (ref)
			return Config
		end)
	end
	return GetSquadFromSquadId
end