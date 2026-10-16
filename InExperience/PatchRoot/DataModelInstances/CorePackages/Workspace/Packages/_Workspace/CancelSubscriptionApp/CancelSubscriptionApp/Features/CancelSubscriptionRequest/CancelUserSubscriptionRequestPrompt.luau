local Parent = script:FindFirstAncestor("CancelSubscriptionApp").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local config = {
	heading = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.Heading",
	bodyText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.Body",
	noButtonText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.DontCancelButton",
	yesButtonText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.YesCancelButton"
}

return function(p1) --[[ Line: 24 | Named "CancelUserSubscriptionRequestPrompt" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy), UseScreenSizeFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.heading,
		bodyText = UseLocalizationResult.bodyText:gsub("{date}", p1.expirationDate),
		buttonStackInfo = {
			forcedFillDirection = Enum.FillDirection.Horizontal,
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.onCancel or function() --[[ Line: 35 ]] end,
						text = UseLocalizationResult.noButtonText,
						delayInputSeconds = 0.75,
						[ReactModule.Tag] = "data-testid=CancelSubscriptionApp_DontCancelButton"
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.onConfirm or function() --[[ Line: 45 ]] end,
						text = UseLocalizationResult.yesButtonText,
						delayInputSeconds = 0.75,
						[ReactModule.Tag] = "data-testid=CancelSubscriptionApp_YesCancelButton"
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeFunction()
	})
end