local CreateMomentDetailsStoreModule = require(script.createMomentDetailsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentDetailsStoreModule (copy)
	return CreateMomentDetailsStoreModule()
end)