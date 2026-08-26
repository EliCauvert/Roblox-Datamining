local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local textKeysModule = require(socialExperienceJoin.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useLocalization({
		titleText = textKeysModule.UnableToJoin,
		bodyText = {
			textKeysModule.NoExperienceAccess,
			name = p1.userPrimaryName
		},
		confirmButtonText = textKeysModule.ViewDetails,
		cancelButtonText = textKeysModule.Cancel
	})
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = p1.screenSize,
		title = var1.titleText,
		bodyText = var1.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = nil,
					props = { text = var1.cancelButtonText, onActivated = p1.cancel }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = var1.confirmButtonText,
						onActivated = p1.openGameDetailsPeekView
					}
				}
			}
		}
	})
end