local robloxSubscriptionStoreModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Store.RobloxSubscriptionStore)

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref)
	robloxSubscriptionStoreModule.get().triggerUnmountUI()
	robloxSubscriptionStoreModule.cleanup()
end