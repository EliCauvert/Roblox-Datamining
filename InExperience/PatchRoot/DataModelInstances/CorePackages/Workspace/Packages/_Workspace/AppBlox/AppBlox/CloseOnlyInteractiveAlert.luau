local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0) --[[ line: 21 ]]
	-- upvalues: useScreenSize (ref), useLocalization (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	return reactModule.createElement(interactiveAlert, {
		screenSize = useScreenSize(),
		title = p0.title,
		bodyText = p0.body,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p0.closeAlert,
						text = p0.buttonText or useLocalization({ closeButtonText = "Feature.ProfileBadges.action.close" }).closeButtonText
					}
				}
			}
		},
		onCloseClicked = if p0.showCloseButton then p0.closeAlert else nil
	})
end