local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetContactEntitiesByContactId" }, function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("contacts-api"):path("v1"):path("contacts"):path("entities"):body({ userContactIds = p2 })
	end)
end