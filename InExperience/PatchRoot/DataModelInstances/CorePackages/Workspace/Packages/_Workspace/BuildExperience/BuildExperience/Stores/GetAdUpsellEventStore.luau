local CreateAdUpsellEventStoreModule = require(script.createAdUpsellEventStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function()
	-- upvalues: CreateAdUpsellEventStoreModule (copy)
	return CreateAdUpsellEventStoreModule()
end)