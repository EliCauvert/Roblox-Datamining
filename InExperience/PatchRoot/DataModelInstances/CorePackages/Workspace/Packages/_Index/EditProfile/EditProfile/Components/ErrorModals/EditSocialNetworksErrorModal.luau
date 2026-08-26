local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local textKeysModule = require(editProfile.Common.TextKeys)
local constantsModule = require(editProfile.Common.Constants)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local useNavigation = require(parent.Navigation).useNavigation
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)

return function()
	-- upvalues: useNavigationProps (ref), useNavigation (ref), useScreenSize (ref), useLocalization (ref), textKeysModule (ref), constantsModule (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useNavigationProps(function(_, p1)
		return { errorCode = p1.errorCode }
	end)
	local var2 = useNavigation()
	local var3 = useScreenSize()
	local var4 = useLocalization({
		title = textKeysModule.SocialNetworksError,
		InvalidFacebook = textKeysModule.InvalidFacebook,
		InvalidX = textKeysModule.InvalidX,
		InvalidYouTube = textKeysModule.InvalidYouTube,
		InvalidTwitch = textKeysModule.InvalidTwitch,
		InvalidGuilded = textKeysModule.InvalidGuilded,
		OK = textKeysModule.OK
	})
	local errorCode = ({
		[constantsModule.SocialNetworksErrorCodes.Facebook] = var4.InvalidFacebook,
		[constantsModule.SocialNetworksErrorCodes.Twitter] = var4.InvalidX,
		[constantsModule.SocialNetworksErrorCodes.YouTube] = var4.InvalidYouTube,
		[constantsModule.SocialNetworksErrorCodes.Twitch] = var4.InvalidTwitch,
		[constantsModule.SocialNetworksErrorCodes.Guilded] = var4.InvalidGuilded
	})[var1.errorCode]
	
	local function onClose()
		-- upvalues: var2 (ref)
		var2.goBack()
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = onClose }, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var3,
			title = var4.title,
			bodyText = errorCode,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onClose, text = var4.OK }
					}
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		screenSize = var3,
		title = var4.title,
		bodyText = errorCode,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onClose, text = var4.OK }
				}
			}
		}
	})
end