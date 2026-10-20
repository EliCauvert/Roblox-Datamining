local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	local Config = nil
	local GetSquadActive = p1.roduxNetworking.GET({ Name = "GetSquadActive" }, function(Callback, p2)
		-- upvalues: p1 (copy), Config (ref), SQUADURLModule (upval)
		if p1.useMockedResponse then
			Config = { responseBody = { groupUp = p2.mockedSquad } }
		end
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("active-status")
	end)
	
	if p1.useMockedResponse then
		GetSquadActive.Mock.clear()
		GetSquadActive.Mock.reply(function()
			-- upvalues: Config (ref)
			return Config
		end)
	end
	return GetSquadActive
end