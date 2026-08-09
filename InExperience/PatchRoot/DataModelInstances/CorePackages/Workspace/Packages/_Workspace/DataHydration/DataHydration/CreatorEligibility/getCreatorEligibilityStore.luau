local createCreatorEligibilityStoreModule = require(script.Parent.createCreatorEligibilityStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createCreatorEligibilityStoreModule (ref)
	return createCreatorEligibilityStoreModule()
end)