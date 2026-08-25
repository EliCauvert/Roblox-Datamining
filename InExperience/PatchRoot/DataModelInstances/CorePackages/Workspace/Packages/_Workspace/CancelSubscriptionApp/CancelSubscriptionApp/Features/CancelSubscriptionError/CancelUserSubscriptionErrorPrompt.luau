local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useLocalization = require(parent.Localization).Hooks.useLocalization
local errorLarge = UIBloxModule.App.ImageSet.Images["icons/status/error_large"]
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local errorStateEnumModule = require(cancelSubscriptionApp.Enums.ErrorStateEnum)
local t = {
	[errorStateEnumModule.Expiring] = "CoreScripts.CancelUserSubscriptionPrompt.ExpiringPrompt.Heading",
	[errorStateEnumModule.Unsubscribed] = "CoreScripts.CancelUserSubscriptionPrompt.UnsubscribedPrompt.Heading",
	[errorStateEnumModule.ErrorCancelling] = "CoreScripts.CancelUserSubscriptionPrompt.ErrorCancellingPrompt.Heading"
}
local t_1 = {
	[errorStateEnumModule.Expiring] = "CoreScripts.CancelUserSubscriptionPrompt.ExpiringPrompt.Body",
	[errorStateEnumModule.Unsubscribed] = "CoreScripts.CancelUserSubscriptionPrompt.UnsubscribedPrompt.Body",
	[errorStateEnumModule.ErrorCancelling] = "CoreScripts.CancelUserSubscriptionPrompt.ErrorCancellingPrompt.Body"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), t_1 (ref), reactModule (ref), interactiveAlert (ref), errorLarge (ref), buttonType (ref), useScreenSize (ref)
	local var6 = useLocalization({
		buttonText = "CoreScripts.CancelUserSubscriptionPrompt.Error.ButtonText",
		heading = t[p0.errorState],
		bodyText = t_1[p0.errorState]
	})
	
	return reactModule.createElement(interactiveAlert, {
		title = var6.heading,
		titleIcon = errorLarge,
		bodyText = var6.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p0.onDismiss or function() end,
						text = var6.buttonText,
						delayInputSeconds = 0.75,
						[reactModule.Tag] = "data-testid=CancelSubscriptionApp_OkButton"
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = useScreenSize()
	})
end