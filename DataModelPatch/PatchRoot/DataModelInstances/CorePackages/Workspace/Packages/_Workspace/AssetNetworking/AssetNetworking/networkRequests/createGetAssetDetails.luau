local ASSETSAPIURLModule = require(script:FindFirstAncestor("AssetNetworking").ASSETS_API_URL)

return function(p1)
	-- upvalues: ASSETSAPIURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetAssetDetails" }, function(Callback, p2)
		-- upvalues: ASSETSAPIURLModule (upval)
		return Callback(ASSETSAPIURLModule):path("v1"):path("assets"):path(p2)
	end)
end