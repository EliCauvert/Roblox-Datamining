local CreateMomentsStoreModule = require(script.createMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsStoreModule (copy)
	return CreateMomentsStoreModule()
end)