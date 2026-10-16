local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IconsStatusErrorLarge = UIBloxModule.App.ImageSet.Images["icons/status/error_large"]
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local ErrorStateEnumModule = require(CancelSubscriptionApp.Enums.ErrorStateEnum)
local config = {
	[ErrorStateEnumModule.Expiring] = "CoreScripts.CancelUserSubscriptionPrompt.ExpiringPrompt.Heading",
	[ErrorStateEnumModule.Unsubscribed] = "CoreScripts.CancelUserSubscriptionPrompt.UnsubscribedPrompt.Heading",
	[ErrorStateEnumModule.ErrorCancelling] = "CoreScripts.CancelUserSubscriptionPrompt.ErrorCancellingPrompt.Heading"
}
local config1 = {
	[ErrorStateEnumModule.Expiring] = "CoreScripts.CancelUserSubscriptionPrompt.ExpiringPrompt.Body",
	[ErrorStateEnumModule.Unsubscribed] = "CoreScripts.CancelUserSubscriptionPrompt.UnsubscribedPrompt.Body",
	[ErrorStateEnumModule.ErrorCancelling] = "CoreScripts.CancelUserSubscriptionPrompt.ErrorCancellingPrompt.Body"
}

return function(p1) --[[ Line: 30 | Named "CancelUserSubscriptionErrorPrompt" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), config1 (copy), ReactModule (copy), InteractiveAlert (copy), IconsStatusErrorLarge (copy), ButtonType (copy), UseScreenSizeFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		buttonText = "CoreScripts.CancelUserSubscriptionPrompt.Error.ButtonText",
		heading = config[p1.errorState],
		bodyText = config1[p1.errorState]
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.heading,
		titleIcon = IconsStatusErrorLarge,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.onDismiss or function() --[[ Line: 46 ]] end,
						text = UseLocalizationResult.buttonText,
						delayInputSeconds = 0.75,
						[ReactModule.Tag] = "data-testid=CancelSubscriptionApp_OkButton"
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeFunction()
	})
end