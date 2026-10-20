local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("UploadContactsByUser", function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("contacts-api"):path("v1"):path("contacts"):body({
			countryCode = p2.countryCode,
			contacts = p2.contacts,
			source = p2.source
		})
	end)
end