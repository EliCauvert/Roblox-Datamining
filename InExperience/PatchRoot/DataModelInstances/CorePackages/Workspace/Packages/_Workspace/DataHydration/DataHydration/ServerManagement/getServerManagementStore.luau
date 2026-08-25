local createServerManagementStoreModule = require(script.Parent.createServerManagementStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createServerManagementStoreModule (ref)
	return createServerManagementStoreModule()
end)