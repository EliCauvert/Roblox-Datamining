local CreateServerManagementStoreModule = require(script.Parent.createServerManagementStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateServerManagementStoreModule (copy)
	return CreateServerManagementStoreModule()
end)