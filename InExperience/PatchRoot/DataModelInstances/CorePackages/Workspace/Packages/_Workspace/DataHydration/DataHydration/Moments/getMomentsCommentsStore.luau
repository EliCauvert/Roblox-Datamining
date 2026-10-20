local CreateMomentsCommentsStoreModule = require(script.Parent.createMomentsCommentsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsCommentsStoreModule (copy)
	return CreateMomentsCommentsStoreModule()
end)