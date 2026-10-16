local CreateCreatorGroupsStoreModule = require(script.Parent.createCreatorGroupsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateCreatorGroupsStoreModule (copy)
	return CreateCreatorGroupsStoreModule()
end)