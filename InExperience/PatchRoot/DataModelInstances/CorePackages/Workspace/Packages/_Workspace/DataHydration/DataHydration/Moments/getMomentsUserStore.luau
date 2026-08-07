local createMomentsUserStoreModule = require(script.Parent.createMomentsUserStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ line: 8 ]]
	-- upvalues: createMomentsUserStoreModule (ref)
	return createMomentsUserStoreModule()
end)