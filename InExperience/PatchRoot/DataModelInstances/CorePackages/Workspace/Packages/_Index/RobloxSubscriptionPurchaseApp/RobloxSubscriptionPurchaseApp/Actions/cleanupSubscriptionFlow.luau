local RobloxSubscriptionStoreModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Store.RobloxSubscriptionStore)

return function() --[[ Line: 5 | Named "cleanupSubscriptionFlow" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy)
	RobloxSubscriptionStoreModule.get().triggerUnmountUI()
	RobloxSubscriptionStoreModule.cleanup()
end