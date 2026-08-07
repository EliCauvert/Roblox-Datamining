local createMomentsShareLinkStoreModule = require(script.Parent.createMomentsShareLinkStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ line: 9 ]]
	-- upvalues: createMomentsShareLinkStoreModule (ref)
	return createMomentsShareLinkStoreModule()
end)