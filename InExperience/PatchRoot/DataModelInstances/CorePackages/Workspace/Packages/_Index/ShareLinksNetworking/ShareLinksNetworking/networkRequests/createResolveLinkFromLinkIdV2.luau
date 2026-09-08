local parent = script.Parent.Parent
local parent_1 = parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.networkingShareLinkTypes)
local fFlagEnableConnectionsDeepLinkSkipFilterCheck = require(parent_1.SharedFlags).FFlagEnableConnectionsDeepLinkSkipFilterCheck

return function(p1)
	-- upvalues: fFlagEnableConnectionsDeepLinkSkipFilterCheck (ref), API_URLModule (ref)
	return p1.roduxNetworking.POST("resolve", function(p2, p3)
		-- upvalues: fFlagEnableConnectionsDeepLinkSkipFilterCheck (copy), API_URLModule (copy)
		return if fFlagEnableConnectionsDeepLinkSkipFilterCheck then p2(API_URLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p3.linkId, skipFilterCheck = p3.skipFilterCheck }) else p2(API_URLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p3.linkId })
	end)
end