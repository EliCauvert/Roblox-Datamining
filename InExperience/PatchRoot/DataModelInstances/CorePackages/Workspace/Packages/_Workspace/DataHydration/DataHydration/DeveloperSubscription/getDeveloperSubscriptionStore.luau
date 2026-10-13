local createDeveloperSubscriptionStoreModule = require(script.Parent.createDeveloperSubscriptionStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createDeveloperSubscriptionStoreModule (ref)
	return createDeveloperSubscriptionStoreModule()
end)