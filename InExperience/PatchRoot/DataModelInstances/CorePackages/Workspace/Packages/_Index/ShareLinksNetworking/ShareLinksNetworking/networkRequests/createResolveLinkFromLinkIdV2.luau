local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.networkingShareLinkTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("resolve", function(p1, p2) --[[ line: 11 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p2.linkId })
	end)
end