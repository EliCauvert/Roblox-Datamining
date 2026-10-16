local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local CleanupSubscriptionFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.cleanupSubscriptionFlow)

return function() --[[ Line: 6 | Named "handleBackButtonAction" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), CleanupSubscriptionFlowModule (copy)
	RobloxSubscriptionStoreModule.get().triggerOnBackButtonActivated()
	CleanupSubscriptionFlowModule()
end