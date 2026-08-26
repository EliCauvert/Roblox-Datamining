local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: useScreenSize (ref), useLocalization (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	return reactModule.createElement(interactiveAlert, {
		screenSize = useScreenSize(),
		title = p1.title,
		bodyText = p1.body,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p1.closeAlert,
						text = p1.buttonText or useLocalization({ closeButtonText = "Feature.ProfileBadges.action.close" }).closeButtonText
					}
				}
			}
		},
		onCloseClicked = if p1.showCloseButton then p1.closeAlert else nil
	})
end