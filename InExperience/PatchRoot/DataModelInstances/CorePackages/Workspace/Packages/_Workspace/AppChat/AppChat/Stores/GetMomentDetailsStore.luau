local CreateMomentDetailsStoreModule = require(script.createMomentDetailsStore)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_) --[[ Line: 9 ]]
	-- upvalues: CreateMomentDetailsStoreModule (copy)
	return CreateMomentDetailsStoreModule()
end)