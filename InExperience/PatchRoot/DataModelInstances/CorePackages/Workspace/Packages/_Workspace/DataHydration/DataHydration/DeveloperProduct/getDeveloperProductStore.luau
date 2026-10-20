local CreateDeveloperProductStoreModule = require(script.Parent.createDeveloperProductStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateDeveloperProductStoreModule (copy)
	return CreateDeveloperProductStoreModule()
end)