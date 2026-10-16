local CreateMomentsCommentsStoreModule = require(script.Parent.createMomentsCommentsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function(_) --[[ Line: 9 ]]
	-- upvalues: CreateMomentsCommentsStoreModule (copy)
	return CreateMomentsCommentsStoreModule()
end)