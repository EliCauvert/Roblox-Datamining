local CreateMomentsUserStoreModule = require(script.Parent.createMomentsUserStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsUserStoreModule (copy)
	return CreateMomentsUserStoreModule()
end)