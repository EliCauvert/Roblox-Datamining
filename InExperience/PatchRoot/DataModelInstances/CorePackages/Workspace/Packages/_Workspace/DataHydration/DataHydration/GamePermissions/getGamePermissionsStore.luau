local CreateGamePermissionsStoreModule = require(script.Parent.createGamePermissionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateGamePermissionsStoreModule (copy)
	return CreateGamePermissionsStoreModule()
end)