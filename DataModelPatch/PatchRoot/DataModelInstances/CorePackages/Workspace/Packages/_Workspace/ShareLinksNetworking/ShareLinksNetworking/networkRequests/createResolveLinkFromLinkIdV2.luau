local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.networkingShareLinkTypes)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return (p1.roduxNetworking.POST({ Name = "resolve" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p2.linkId })
	end))
end