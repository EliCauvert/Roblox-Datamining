local createCreatorInventoryStoreModule = require(script.Parent.createCreatorInventoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createCreatorInventoryStoreModule (ref)
	return createCreatorInventoryStoreModule()
end)