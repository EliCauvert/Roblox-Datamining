local createMomentsCommentsStoreModule = require(script.Parent.createMomentsCommentsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsCommentsStoreModule (ref)
	return createMomentsCommentsStoreModule()
end)