local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET(script.Name, function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("user-settings-api"):path("v1"):path("user-settings"):queryArgs(p2)
	end)
end