local createAdUpsellEventStoreModule = require(script.createAdUpsellEventStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function()
	-- upvalues: createAdUpsellEventStoreModule (ref)
	return createAdUpsellEventStoreModule()
end)