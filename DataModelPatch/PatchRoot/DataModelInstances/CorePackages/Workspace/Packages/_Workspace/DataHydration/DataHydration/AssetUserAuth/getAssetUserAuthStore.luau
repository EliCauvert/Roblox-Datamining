local CreateAssetUserAuthStoreModule = require(script.Parent.createAssetUserAuthStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateAssetUserAuthStoreModule (copy)
	return CreateAssetUserAuthStoreModule()
end)