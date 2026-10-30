local CreateMomentsFollowingStoreModule = require(script.Parent.createMomentsFollowingStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsFollowingStoreModule (copy)
	return CreateMomentsFollowingStoreModule()
end)