local createServerManagementStoreModule = require(script.Parent.createServerManagementStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createServerManagementStoreModule (ref)
	return createServerManagementStoreModule()
end)