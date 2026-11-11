local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local TextKeysModule = require(EditProfile.Common.TextKeys)
local ConstantsModule = require(EditProfile.Common.Constants)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)

return function()
	-- upvalues: UseNavigationPropsFunction (copy), UseNavigationFunction (copy), UseScreenSizeFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ConstantsModule (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return { errorCode = p1.errorCode }
	end)
	local UseNavigationResult = UseNavigationFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = TextKeysModule.SocialNetworksError,
		InvalidFacebook = TextKeysModule.InvalidFacebook,
		InvalidX = TextKeysModule.InvalidX,
		InvalidYouTube = TextKeysModule.InvalidYouTube,
		InvalidTwitch = TextKeysModule.InvalidTwitch,
		InvalidGuilded = TextKeysModule.InvalidGuilded,
		OK = TextKeysModule.OK
	})
	local Entry = ({
		[ConstantsModule.SocialNetworksErrorCodes.Facebook] = UseLocalizationResult.InvalidFacebook,
		[ConstantsModule.SocialNetworksErrorCodes.Twitter] = UseLocalizationResult.InvalidX,
		[ConstantsModule.SocialNetworksErrorCodes.YouTube] = UseLocalizationResult.InvalidYouTube,
		[ConstantsModule.SocialNetworksErrorCodes.Twitch] = UseLocalizationResult.InvalidTwitch,
		[ConstantsModule.SocialNetworksErrorCodes.Guilded] = UseLocalizationResult.InvalidGuilded
	})[UseNavigationPropsResult.errorCode]
	
	local function onClose()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = onClose }, {
		ReactModule.createElement(InteractiveAlert, {
			screenSize = UseScreenSizeResult,
			title = UseLocalizationResult.title,
			bodyText = Entry,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = onClose, text = UseLocalizationResult.OK }
					}
				}
			}
		})
	}) else ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = UseLocalizationResult.title,
		bodyText = Entry,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = onClose, text = UseLocalizationResult.OK }
				}
			}
		}
	})
end