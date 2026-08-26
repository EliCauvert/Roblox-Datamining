local parent = script:FindFirstAncestor("VerifiedParentalConsentDialog").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useLocalization({
		GoToSettings = "Common.VerifiedParentalConsent.Action.GoToSettings",
		Cancel = "Common.VerifiedParentalConsent.Action.Cancel",
		Close = "Common.VerifiedParentalConsent.Action.Close"
	})
	
	return reactModule.createElement(interactiveAlert, {
		title = p1.title,
		titleIcon = p1.titleIcon,
		bodyText = p1.bodyText,
		buttonStackInfo = {
			buttons = (function()
				-- upvalues: p1 (ref), buttonType (copy), var1 (ref)
				return if p1.isActionable then {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = if p1.onAction then p1.onAction else p1.onDismiss,
							text = var1.GoToSettings
						}
					},
					{
						props = { onActivated = p1.onDismiss, text = var1.Cancel }
					}
				} else {
					{
						props = { onActivated = p1.onDismiss, text = var1.Close }
					}
				}
			end)()
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.screenSize,
		middleContent = p1.middleContent
	})
end