local parent = script:FindFirstAncestor("CancelSubscriptionApp").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local t = {
	heading = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.Heading",
	bodyText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.Body",
	noButtonText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.DontCancelButton",
	yesButtonText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.YesCancelButton"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref), useScreenSize (ref)
	local var3 = useLocalization(t)
	
	return reactModule.createElement(interactiveAlert, {
		title = var3.heading,
		bodyText = var3.bodyText:gsub("{date}", p0.expirationDate),
		buttonStackInfo = {
			forcedFillDirection = Enum.FillDirection.Horizontal,
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p0.onCancel or function() end,
						text = var3.noButtonText,
						delayInputSeconds = 0.75,
						[reactModule.Tag] = "data-testid=CancelSubscriptionApp_DontCancelButton"
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p0.onConfirm or function() end,
						text = var3.yesButtonText,
						delayInputSeconds = 0.75,
						[reactModule.Tag] = "data-testid=CancelSubscriptionApp_YesCancelButton"
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = useScreenSize()
	})
end