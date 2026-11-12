local CreateMomentsUsageStoreModule = require(script.createMomentsUsageStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsUsageStoreModule (copy)
	return CreateMomentsUsageStoreModule()
end)