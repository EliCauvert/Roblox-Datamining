local signalsModule = require(script:FindFirstAncestor("DiscoveryAvailability").Parent.Signals)
local _ = require(script.Parent.CacheStoreTypes)

return signalsModule.createComputed(function() --[[ line: 15 | named "createCacheStore" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getHomePageDataSource = var1,
		setHomePageDataSource = var2
	}
end)