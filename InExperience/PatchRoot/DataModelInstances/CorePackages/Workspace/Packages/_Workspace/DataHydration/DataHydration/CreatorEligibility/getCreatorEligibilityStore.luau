local createCreatorEligibilityStoreModule = require(script.Parent.createCreatorEligibilityStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createCreatorEligibilityStoreModule (ref)
	return createCreatorEligibilityStoreModule()
end)