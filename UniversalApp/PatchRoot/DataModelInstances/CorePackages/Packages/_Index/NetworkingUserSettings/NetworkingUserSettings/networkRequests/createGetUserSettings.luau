local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.GET(script.Name, function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("user-settings-api"):path("v1"):path("user-settings"):queryArgs(p3)
	end)
end