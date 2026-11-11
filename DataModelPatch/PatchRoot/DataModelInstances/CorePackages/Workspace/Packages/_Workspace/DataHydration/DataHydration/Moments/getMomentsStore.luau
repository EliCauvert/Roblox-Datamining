local CreateMomentsStoreModule = require(script.Parent.createMomentsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsStoreModule (copy)
	return CreateMomentsStoreModule()
end)