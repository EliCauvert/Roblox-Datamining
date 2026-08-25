local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local cleanupSubscriptionFlowModule = require(robloxSubscriptionPurchaseApp.Actions.cleanupSubscriptionFlow)

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), cleanupSubscriptionFlowModule (ref)
	robloxSubscriptionStoreModule.get().triggerOnBackButtonActivated()
	cleanupSubscriptionFlowModule()
end