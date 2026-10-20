local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.networkingShareLinkTypes)
local FFlagEnableConnectionsDeepLinkSkipFilterCheck = require(Parent.Parent.SharedFlags).FFlagEnableConnectionsDeepLinkSkipFilterCheck

return function(p1)
	-- upvalues: FFlagEnableConnectionsDeepLinkSkipFilterCheck (copy), APIURLModule (copy)
	return (p1.roduxNetworking.POST("resolve", function(Callback, p2)
		-- upvalues: FFlagEnableConnectionsDeepLinkSkipFilterCheck (upval), APIURLModule (upval)
		return if FFlagEnableConnectionsDeepLinkSkipFilterCheck then Callback(APIURLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p2.linkId, skipFilterCheck = p2.skipFilterCheck }) else Callback(APIURLModule):path("deeplinks"):path("v2"):path("resolve"):body({ linkId = p2.linkId })
	end))
end