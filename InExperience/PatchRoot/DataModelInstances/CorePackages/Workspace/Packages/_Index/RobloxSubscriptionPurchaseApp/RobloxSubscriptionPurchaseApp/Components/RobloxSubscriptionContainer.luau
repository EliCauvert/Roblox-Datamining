local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local SignalsReactModule = require(Parent.SignalsReact)
local UseNativePurchaseFinishedListenerModule = require(RobloxSubscriptionPurchaseApp.Hooks.useNativePurchaseFinishedListener)
local UseRobloxSubscriptionChangedListenerModule = require(RobloxSubscriptionPurchaseApp.Hooks.useRobloxSubscriptionChangedListener)
local UseSubscriptionPollingTimeoutGuardModule = require(RobloxSubscriptionPurchaseApp.Hooks.useSubscriptionPollingTimeoutGuard)
local Sheet = FoundationModule.Sheet
local DialogSize = FoundationModule.Enums.DialogSize
local BlackbirdSheetContentModule = require(script.Parent.BlackbirdSheetContent)
local ErrorSheetContentModule = require(script.Parent.ErrorSheetContent)
local config = { [PromptStateModule.Error] = true }
local config1 = {
	[PromptStateModule.SubscriptionPurchaseUIReady] = true,
	[PromptStateModule.SubscriptionPurchaseInProgress] = true,
	[PromptStateModule.SubscriptionStatusPolling] = true,
	[PromptStateModule.Error] = true
}

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), UseNativePurchaseFinishedListenerModule (copy), UseRobloxSubscriptionChangedListenerModule (copy), UseSubscriptionPollingTimeoutGuardModule (copy), BlackbirdSheetContentModule (copy), ErrorSheetContentModule (copy), config (copy), config1 (copy), ReactModule (copy), Sheet (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), DialogSize (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionStoreModule.get().getPromptState)
	UseNativePurchaseFinishedListenerModule()
	UseRobloxSubscriptionChangedListenerModule()
	UseSubscriptionPollingTimeoutGuardModule()
	local BlackbirdSheetContentModuleResult = BlackbirdSheetContentModule()
	local ErrorSheetContentModuleResult = ErrorSheetContentModule()
	local ErrorSheetContentModuleResult1 = if config[UseSignalStateResult] == true then ErrorSheetContentModuleResult else BlackbirdSheetContentModuleResult
	
	return config1[UseSignalStateResult] == true and ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = function()
			-- upvalues: CompleteRobloxSubscriptionUpsellFlowModule (upval)
			CompleteRobloxSubscriptionUpsellFlowModule()
		end,
		size = DialogSize.Medium
	}, {
		Header = ErrorSheetContentModuleResult1.Header,
		Content = ErrorSheetContentModuleResult1.Content,
		Actions = ErrorSheetContentModuleResult1.Actions
	}) or nil
end