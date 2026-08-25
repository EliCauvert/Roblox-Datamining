local createMomentsStoreModule = require(script.createMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsStoreModule (ref)
	return createMomentsStoreModule()
end)