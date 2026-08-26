local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local signalsReactModule = require(parent.SignalsReact)
local useNativePurchaseFinishedListenerModule = require(robloxSubscriptionPurchaseApp.Hooks.useNativePurchaseFinishedListener)
local useRobloxSubscriptionChangedListenerModule = require(robloxSubscriptionPurchaseApp.Hooks.useRobloxSubscriptionChangedListener)
local useSubscriptionPollingTimeoutGuardModule = require(robloxSubscriptionPurchaseApp.Hooks.useSubscriptionPollingTimeoutGuard)
local sheet = foundationModule.Sheet
local dialogSize = foundationModule.Enums.DialogSize
local blackbirdSheetContentModule = require(script.Parent.BlackbirdSheetContent)
local errorSheetContentModule = require(script.Parent.ErrorSheetContent)
local t = { [promptStateModule.Error] = true }
local t_1 = {
	[promptStateModule.SubscriptionPurchaseUIReady] = true,
	[promptStateModule.SubscriptionPurchaseInProgress] = true,
	[promptStateModule.SubscriptionStatusPolling] = true,
	[promptStateModule.Error] = true
}

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), useNativePurchaseFinishedListenerModule (ref), useRobloxSubscriptionChangedListenerModule (ref), useSubscriptionPollingTimeoutGuardModule (ref), blackbirdSheetContentModule (ref), errorSheetContentModule (ref), t (ref), t_1 (ref), reactModule (ref), sheet (ref), completeRobloxSubscriptionUpsellFlowModule (ref), dialogSize (ref)
	local var1 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getPromptState)
	useNativePurchaseFinishedListenerModule()
	useRobloxSubscriptionChangedListenerModule()
	useSubscriptionPollingTimeoutGuardModule()
	local var2 = if t[var1] == true then errorSheetContentModule() else blackbirdSheetContentModule()
	
	return t_1[var1] == true and reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = function()
			-- upvalues: completeRobloxSubscriptionUpsellFlowModule (copy)
			completeRobloxSubscriptionUpsellFlowModule()
		end,
		size = dialogSize.Medium
	}, {
		Header = var2.Header,
		Content = var2.Content,
		Actions = var2.Actions
	}) or nil
end