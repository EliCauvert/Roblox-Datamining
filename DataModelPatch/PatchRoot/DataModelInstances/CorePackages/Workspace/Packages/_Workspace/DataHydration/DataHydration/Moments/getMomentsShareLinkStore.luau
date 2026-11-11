local CreateMomentsShareLinkStoreModule = require(script.Parent.createMomentsShareLinkStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsShareLinkStoreModule (copy)
	return CreateMomentsShareLinkStoreModule()
end)