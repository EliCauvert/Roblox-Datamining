local createCreatorGroupsStoreModule = require(script.Parent.createCreatorGroupsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createCreatorGroupsStoreModule (ref)
	return createCreatorGroupsStoreModule()
end)