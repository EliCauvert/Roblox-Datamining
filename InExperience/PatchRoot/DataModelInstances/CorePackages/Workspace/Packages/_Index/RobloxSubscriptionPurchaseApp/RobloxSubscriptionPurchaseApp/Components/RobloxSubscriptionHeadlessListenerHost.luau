local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local UseNativePurchaseFinishedListenerModule = require(RobloxSubscriptionPurchaseApp.Hooks.useNativePurchaseFinishedListener)
local FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallback)
local UseRobloxSubscriptionChangedListenerModule = require(RobloxSubscriptionPurchaseApp.Hooks.useRobloxSubscriptionChangedListener)
local UseSubscriptionPollingTimeoutGuardModule = require(RobloxSubscriptionPurchaseApp.Hooks.useSubscriptionPollingTimeoutGuard)
local UseHeadlessSubscriptionErrorCompletionModule = require(RobloxSubscriptionPurchaseApp.Hooks.useHeadlessSubscriptionErrorCompletion)

return function() --[[ Line: 15 | Named "RobloxSubscriptionHeadlessListenerHost" ]]
	-- upvalues: FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule (copy), UseNativePurchaseFinishedListenerModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), UseRobloxSubscriptionChangedListenerModule (copy), UseSubscriptionPollingTimeoutGuardModule (copy), UseHeadlessSubscriptionErrorCompletionModule (copy)
	if FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule then
		UseNativePurchaseFinishedListenerModule(nil, nil, function() --[[ Line: 17 ]]
			-- upvalues: CompleteRobloxSubscriptionUpsellFlowModule (upval)
			CompleteRobloxSubscriptionUpsellFlowModule()
		end)
	else
		UseNativePurchaseFinishedListenerModule()
	end
	UseRobloxSubscriptionChangedListenerModule()
	UseSubscriptionPollingTimeoutGuardModule()
	UseHeadlessSubscriptionErrorCompletionModule()
	
	return nil
end