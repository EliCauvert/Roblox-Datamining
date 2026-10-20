local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local CleanupSubscriptionFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.cleanupSubscriptionFlow)

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy), CleanupSubscriptionFlowModule (copy)
	RobloxSubscriptionStoreModule.get().triggerOnBackButtonActivated()
	CleanupSubscriptionFlowModule()
end