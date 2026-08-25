local ASSETS_API_URLModule = require(script:FindFirstAncestor("AssetNetworking").ASSETS_API_URL)

return function(p0)
	-- upvalues: ASSETS_API_URLModule (ref)
	return p0.roduxNetworking.GET("GetAssetDetails", function(p1, p2)
		-- upvalues: ASSETS_API_URLModule (copy)
		return p1(ASSETS_API_URLModule):path("v1"):path("assets"):path(p2)
	end)
end