local createMomentsShareLinkStoreModule = require(script.Parent.createMomentsShareLinkStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsShareLinkStoreModule (ref)
	return createMomentsShareLinkStoreModule()
end)