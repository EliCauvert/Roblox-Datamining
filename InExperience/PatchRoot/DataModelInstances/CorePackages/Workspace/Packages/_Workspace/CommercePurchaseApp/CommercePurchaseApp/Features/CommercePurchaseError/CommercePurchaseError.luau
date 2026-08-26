local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local parent = commercePurchaseApp.Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local errorCodeEnumModule = require(commercePurchaseApp.Enums.ErrorCodeEnum)
local fFlagAddCommerceErrorsModule = require(commercePurchaseApp.Flags.FFlagAddCommerceErrors)
local t = {
	[errorCodeEnumModule.NotPurchasable] = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
}
local t_1 = {
	[errorCodeEnumModule.NotPurchasable] = {
		title = "CoreScripts.CommercePurchasePrompt.ProductNotAvailable",
		reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
	},
	[errorCodeEnumModule.DeviceNotSupported] = {
		title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Title.DeviceNotSupported",
		reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.DeviceNotSupported"
	},
	[errorCodeEnumModule.AccountNotSupported] = {
		title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Title.AccountNotSupported",
		reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.AccountNotSupported"
	}
}

return function(p1)
	-- upvalues: useScreenSize (ref), useLocalization (ref), fFlagAddCommerceErrorsModule (ref), t_1 (ref), t (ref), reactModule (ref), interactiveAlert (ref), images (ref)
	local var1 = useLocalization({
		dismissCTA = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.DismissCTA",
		title = if fFlagAddCommerceErrorsModule then t_1[p1.errorCode].title else "CoreScripts.CommercePurchasePrompt.ErrorPrompt.CantBuy",
		errorReason = if fFlagAddCommerceErrorsModule then t_1[p1.errorCode].reason else t[p1.errorCode]
	})
	
	return reactModule.createElement(interactiveAlert, {
		title = var1.title,
		titleIcon = images["icons/status/error_large"],
		bodyText = var1.errorReason,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.onDismiss, text = var1.dismissCTA }
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = useScreenSize()
	})
end