local createMomentDetailsStoreModule = require(script.createMomentDetailsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_) --[[ line: 9 ]]
	-- upvalues: createMomentDetailsStoreModule (ref)
	return createMomentDetailsStoreModule()
end)