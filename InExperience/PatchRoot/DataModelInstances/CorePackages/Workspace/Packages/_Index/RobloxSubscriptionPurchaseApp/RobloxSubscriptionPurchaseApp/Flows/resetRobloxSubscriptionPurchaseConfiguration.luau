local RobloxSubscriptionStoreModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Store.RobloxSubscriptionStore)

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	GetResult.setPurchaseUIOptions({})
	GetResult.setPurchaseFlowOptions({})
	GetResult.setOnFlowComplete(nil)
	GetResult.setOnBackButtonActivated(nil)
	GetResult.setOnCtaOverride(nil)
end