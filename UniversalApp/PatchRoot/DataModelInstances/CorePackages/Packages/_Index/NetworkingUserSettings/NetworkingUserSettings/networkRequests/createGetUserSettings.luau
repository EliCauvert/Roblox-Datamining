local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET(script.Name, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("user-settings-api"):path("v1"):path("user-settings"):queryArgs(p2)
	end)
end