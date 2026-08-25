local createCreatorInventoryStoreModule = require(script.Parent.createCreatorInventoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createCreatorInventoryStoreModule (ref)
	return createCreatorInventoryStoreModule()
end)