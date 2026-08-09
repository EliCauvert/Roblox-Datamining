local createServerManagementStoreModule = require(script.Parent.createServerManagementStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createServerManagementStoreModule (ref)
	return createServerManagementStoreModule()
end)