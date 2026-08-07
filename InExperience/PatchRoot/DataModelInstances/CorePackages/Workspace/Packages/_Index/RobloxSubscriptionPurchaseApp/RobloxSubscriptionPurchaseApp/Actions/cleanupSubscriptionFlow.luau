local robloxSubscriptionStoreModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Store.RobloxSubscriptionStore)

return function() --[[ line: 5 | named "cleanupSubscriptionFlow" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref)
	robloxSubscriptionStoreModule.get().triggerUnmountUI()
	robloxSubscriptionStoreModule.cleanup()
end