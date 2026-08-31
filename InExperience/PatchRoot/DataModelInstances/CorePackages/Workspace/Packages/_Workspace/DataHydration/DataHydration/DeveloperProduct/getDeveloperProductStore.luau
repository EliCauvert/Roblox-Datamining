local createDeveloperProductStoreModule = require(script.Parent.createDeveloperProductStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createDeveloperProductStoreModule (ref)
	return createDeveloperProductStoreModule()
end)