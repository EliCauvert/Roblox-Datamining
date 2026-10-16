local CreateAssetUserAuthStoreModule = require(script.Parent.createAssetUserAuthStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateAssetUserAuthStoreModule (copy)
	return CreateAssetUserAuthStoreModule()
end)