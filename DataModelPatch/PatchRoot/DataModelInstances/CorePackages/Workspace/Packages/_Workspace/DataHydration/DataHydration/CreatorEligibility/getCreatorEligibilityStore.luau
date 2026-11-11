local CreateCreatorEligibilityStoreModule = require(script.Parent.createCreatorEligibilityStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateCreatorEligibilityStoreModule (copy)
	return CreateCreatorEligibilityStoreModule()
end)