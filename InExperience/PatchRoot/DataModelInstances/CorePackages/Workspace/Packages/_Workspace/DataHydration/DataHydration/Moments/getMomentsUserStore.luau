local createMomentsUserStoreModule = require(script.Parent.createMomentsUserStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsUserStoreModule (ref)
	return createMomentsUserStoreModule()
end)