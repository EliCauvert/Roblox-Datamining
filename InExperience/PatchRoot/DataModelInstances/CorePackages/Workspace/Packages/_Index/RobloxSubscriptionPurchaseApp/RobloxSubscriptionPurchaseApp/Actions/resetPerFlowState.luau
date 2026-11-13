local RobloxSubscriptionStoreModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Store.RobloxSubscriptionStore)

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy)
	RobloxSubscriptionStoreModule.get().setMembershipConfigSnapshot(nil)
end