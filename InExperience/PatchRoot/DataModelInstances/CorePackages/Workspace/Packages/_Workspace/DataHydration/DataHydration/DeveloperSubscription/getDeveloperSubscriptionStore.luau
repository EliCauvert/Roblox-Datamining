local CreateDeveloperSubscriptionStoreModule = require(script.Parent.createDeveloperSubscriptionStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateDeveloperSubscriptionStoreModule (copy)
	return CreateDeveloperSubscriptionStoreModule()
end)