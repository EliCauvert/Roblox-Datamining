local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Parent = SocialExperienceJoin.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local TextKeysModule = require(SocialExperienceJoin.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = TextKeysModule.UnableToJoin,
		bodyText = {
			TextKeysModule.NoExperienceAccess,
			name = p1.userPrimaryName
		},
		confirmButtonText = TextKeysModule.ViewDetails,
		cancelButtonText = TextKeysModule.Cancel
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = p1.screenSize,
		title = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = nil,
					props = {
						text = UseLocalizationResult.cancelButtonText,
						onActivated = p1.cancel
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						text = UseLocalizationResult.confirmButtonText,
						onActivated = p1.openGameDetailsPeekView
					}
				}
			}
		}
	})
end