local Parent = script:FindFirstAncestor("VerifiedParentalConsentDialog").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		GoToSettings = "Common.VerifiedParentalConsent.Action.GoToSettings",
		Cancel = "Common.VerifiedParentalConsent.Action.Cancel",
		Close = "Common.VerifiedParentalConsent.Action.Close"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = p1.title,
		titleIcon = p1.titleIcon,
		bodyText = p1.bodyText,
		buttonStackInfo = {
			buttons = (function()
				-- upvalues: p1 (copy), ButtonType (upval), UseLocalizationResult (copy)
				return if p1.isActionable then {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = if p1.onAction then p1.onAction else p1.onDismiss,
							text = UseLocalizationResult.GoToSettings
						}
					},
					{
						props = {
							onActivated = p1.onDismiss,
							text = UseLocalizationResult.Cancel
						}
					}
				} else {
					{
						props = {
							onActivated = p1.onDismiss,
							text = UseLocalizationResult.Close
						}
					}
				}
			end)()
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.screenSize,
		middleContent = p1.middleContent
	})
end