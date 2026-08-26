local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.networkingShareLinkTypes)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.POST("resolve", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p3.linkId })
	end)
end