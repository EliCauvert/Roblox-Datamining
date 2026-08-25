local createAssetUserAuthStoreModule = require(script.Parent.createAssetUserAuthStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createAssetUserAuthStoreModule (ref)
	return createAssetUserAuthStoreModule()
end)