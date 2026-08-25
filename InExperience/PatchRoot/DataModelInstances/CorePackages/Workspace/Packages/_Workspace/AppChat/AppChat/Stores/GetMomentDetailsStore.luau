local createMomentDetailsStoreModule = require(script.createMomentDetailsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentDetailsStoreModule (ref)
	return createMomentDetailsStoreModule()
end)