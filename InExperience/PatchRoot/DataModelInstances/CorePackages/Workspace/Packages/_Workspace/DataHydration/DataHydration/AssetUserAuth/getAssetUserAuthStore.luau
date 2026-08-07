local createAssetUserAuthStoreModule = require(script.Parent.createAssetUserAuthStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createAssetUserAuthStoreModule (ref)
	return createAssetUserAuthStoreModule()
end)