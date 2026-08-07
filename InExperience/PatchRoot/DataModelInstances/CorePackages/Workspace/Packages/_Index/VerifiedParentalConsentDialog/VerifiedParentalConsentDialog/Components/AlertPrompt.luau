local parent = script:FindFirstAncestor("VerifiedParentalConsentDialog").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0) --[[ line: 21 | named "AlertPrompt" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var2 = useLocalization({
		GoToSettings = "Common.VerifiedParentalConsent.Action.GoToSettings",
		Cancel = "Common.VerifiedParentalConsent.Action.Cancel",
		Close = "Common.VerifiedParentalConsent.Action.Close"
	})
	
	return reactModule.createElement(interactiveAlert, {
		title = p0.title,
		titleIcon = p0.titleIcon,
		bodyText = p0.bodyText,
		buttonStackInfo = {
			buttons = (function() --[[ line: 33 ]]
				-- upvalues: p0 (ref), buttonType (copy), var2 (ref)
				return if p0.isActionable then {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = if p0.onAction then p0.onAction else p0.onDismiss,
							text = var2.GoToSettings
						}
					},
					{
						props = { onActivated = p0.onDismiss, text = var2.Cancel }
					}
				} else {
					{
						props = { onActivated = p0.onDismiss, text = var2.Close }
					}
				}
			end)()
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p0.screenSize,
		middleContent = p0.middleContent
	})
end