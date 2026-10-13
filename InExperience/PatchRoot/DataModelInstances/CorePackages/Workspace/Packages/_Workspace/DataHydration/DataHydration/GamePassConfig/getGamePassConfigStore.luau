local createGamePassConfigStoreModule = require(script.Parent.createGamePassConfigStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createGamePassConfigStoreModule (ref)
	return createGamePassConfigStoreModule()
end)