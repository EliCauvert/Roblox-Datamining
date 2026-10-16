local CreateDeveloperSubscriptionStoreModule = require(script.Parent.createDeveloperSubscriptionStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateDeveloperSubscriptionStoreModule (copy)
	return CreateDeveloperSubscriptionStoreModule()
end)