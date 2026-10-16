local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1) --[[ Line: 21 ]]
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalizationResult = UseLocalizationFunction({ closeButtonText = "Feature.ProfileBadges.action.close" })
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = p1.title,
		bodyText = p1.body,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = p1.closeAlert,
						text = p1.buttonText or UseLocalizationResult.closeButtonText
					}
				}
			}
		},
		onCloseClicked = if p1.showCloseButton then p1.closeAlert else nil
	})
end