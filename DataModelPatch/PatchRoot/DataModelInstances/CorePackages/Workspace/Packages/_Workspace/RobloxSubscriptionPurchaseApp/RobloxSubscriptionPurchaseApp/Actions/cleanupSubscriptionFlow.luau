local RobloxSubscriptionStoreModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Store.RobloxSubscriptionStore)

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy)
	RobloxSubscriptionStoreModule.get().triggerUnmountUI()
	RobloxSubscriptionStoreModule.cleanup()
end