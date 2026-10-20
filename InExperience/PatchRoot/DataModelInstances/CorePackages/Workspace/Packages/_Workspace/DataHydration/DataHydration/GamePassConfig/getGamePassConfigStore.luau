local CreateGamePassConfigStoreModule = require(script.Parent.createGamePassConfigStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateGamePassConfigStoreModule (copy)
	return CreateGamePassConfigStoreModule()
end)