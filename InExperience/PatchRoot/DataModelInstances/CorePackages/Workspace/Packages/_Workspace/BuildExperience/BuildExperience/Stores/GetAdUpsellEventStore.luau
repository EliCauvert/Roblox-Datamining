local CreateAdUpsellEventStoreModule = require(script.createAdUpsellEventStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function() --[[ Line: 9 ]]
	-- upvalues: CreateAdUpsellEventStoreModule (copy)
	return CreateAdUpsellEventStoreModule()
end)