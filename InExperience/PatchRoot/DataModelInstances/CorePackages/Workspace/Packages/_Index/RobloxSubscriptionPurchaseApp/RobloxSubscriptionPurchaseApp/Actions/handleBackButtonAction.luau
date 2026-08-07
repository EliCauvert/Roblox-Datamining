local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local cleanupSubscriptionFlowModule = require(robloxSubscriptionPurchaseApp.Actions.cleanupSubscriptionFlow)

return function() --[[ line: 6 | named "handleBackButtonAction" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), cleanupSubscriptionFlowModule (ref)
	robloxSubscriptionStoreModule.get().triggerOnBackButtonActivated()
	cleanupSubscriptionFlowModule()
end