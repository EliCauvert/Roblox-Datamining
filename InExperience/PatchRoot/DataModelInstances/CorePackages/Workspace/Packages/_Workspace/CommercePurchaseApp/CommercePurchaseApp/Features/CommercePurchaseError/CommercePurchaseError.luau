local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local Parent = CommercePurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ErrorCodeEnumModule = require(CommercePurchaseApp.Enums.ErrorCodeEnum)
local FFlagAddCommerceErrorsModule = require(CommercePurchaseApp.Flags.FFlagAddCommerceErrors)
local config = {
	[ErrorCodeEnumModule.NotPurchasable] = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
}
local config1 = {
	[ErrorCodeEnumModule.NotPurchasable] = {
		title = "CoreScripts.CommercePurchasePrompt.ProductNotAvailable",
		reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
	},
	[ErrorCodeEnumModule.DeviceNotSupported] = {
		title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Title.DeviceNotSupported",
		reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.DeviceNotSupported"
	},
	[ErrorCodeEnumModule.AccountNotSupported] = {
		title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Title.AccountNotSupported",
		reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.AccountNotSupported"
	}
}

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), FFlagAddCommerceErrorsModule (copy), config1 (copy), config (copy), ReactModule (copy), InteractiveAlert (copy), Images (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		dismissCTA = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.DismissCTA",
		title = if FFlagAddCommerceErrorsModule then config1[p1.errorCode].title else "CoreScripts.CommercePurchasePrompt.ErrorPrompt.CantBuy",
		errorReason = if FFlagAddCommerceErrorsModule then config1[p1.errorCode].reason else config[p1.errorCode]
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.title,
		titleIcon = Images["icons/status/error_large"],
		bodyText = UseLocalizationResult.errorReason,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.onDismiss,
						text = UseLocalizationResult.dismissCTA
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeResult
	})
end