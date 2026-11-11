local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetContactEntitiesByContactId" }, function(Callback, UserContactIds)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("contacts-api"):path("v1"):path("contacts"):path("entities"):body({ userContactIds = UserContactIds })
	end)
end