local CreateMomentsShareLinkStoreModule = require(script.Parent.createMomentsShareLinkStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ Line: 9 ]]
	-- upvalues: CreateMomentsShareLinkStoreModule (copy)
	return CreateMomentsShareLinkStoreModule()
end)