local ASSETS_API_URLModule = require(script:FindFirstAncestor("AssetNetworking").ASSETS_API_URL)

return function(p1)
	-- upvalues: ASSETS_API_URLModule (ref)
	return p1.roduxNetworking.GET("GetAssetDetails", function(p2, p3)
		-- upvalues: ASSETS_API_URLModule (copy)
		return p2(ASSETS_API_URLModule):path("v1"):path("assets"):path(p3)
	end)
end