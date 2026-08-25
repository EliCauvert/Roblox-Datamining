local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local textKeysModule = require(socialExperienceJoin.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var4 = useLocalization({
		titleText = textKeysModule.UnableToJoin,
		bodyText = {
			textKeysModule.NoExperienceAccess,
			name = p0.userPrimaryName
		},
		confirmButtonText = textKeysModule.ViewDetails,
		cancelButtonText = textKeysModule.Cancel
	})
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = p0.screenSize,
		title = var4.titleText,
		bodyText = var4.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = nil,
					props = { text = var4.cancelButtonText, onActivated = p0.cancel }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = var4.confirmButtonText,
						onActivated = p0.openGameDetailsPeekView
					}
				}
			}
		}
	})
end