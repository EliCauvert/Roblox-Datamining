local SignalsModule = require(script:FindFirstAncestor("DiscoveryAvailability").Parent.Signals)
local _ = require(script.Parent.CacheStoreTypes)

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getHomePageDataSource = Signal,
		setHomePageDataSource = Signal2
	}
end)