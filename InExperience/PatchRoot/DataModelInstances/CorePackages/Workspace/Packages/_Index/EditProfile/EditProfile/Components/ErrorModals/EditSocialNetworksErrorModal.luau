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

return function() --[[ line: 18 | named "EditSocialNetworksErrorModal" ]]
	-- upvalues: useNavigationProps (ref), useNavigation (ref), useScreenSize (ref), useLocalization (ref), textKeysModule (ref), constantsModule (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var7 = useNavigationProps(function(_, p0) --[[ line: 19 ]]
		return { errorCode = p0.errorCode }
	end)
	local var8 = useNavigation()
	local var9 = useScreenSize()
	local var10 = useLocalization({
		title = textKeysModule.SocialNetworksError,
		InvalidFacebook = textKeysModule.InvalidFacebook,
		InvalidX = textKeysModule.InvalidX,
		InvalidYouTube = textKeysModule.InvalidYouTube,
		InvalidTwitch = textKeysModule.InvalidTwitch,
		InvalidGuilded = textKeysModule.InvalidGuilded,
		OK = textKeysModule.OK
	})
	local errorCode = ({
		[constantsModule.SocialNetworksErrorCodes.Facebook] = var10.InvalidFacebook,
		[constantsModule.SocialNetworksErrorCodes.Twitter] = var10.InvalidX,
		[constantsModule.SocialNetworksErrorCodes.YouTube] = var10.InvalidYouTube,
		[constantsModule.SocialNetworksErrorCodes.Twitch] = var10.InvalidTwitch,
		[constantsModule.SocialNetworksErrorCodes.Guilded] = var10.InvalidGuilded
	})[var7.errorCode]
	
	local function onClose() --[[ line: 45 ]]
		-- upvalues: var8 (ref)
		var8.goBack()
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = onClose }, {
		reactModule.createElement(interactiveAlert, {
			screenSize = var9,
			title = var10.title,
			bodyText = errorCode,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onClose, text = var10.OK }
					}
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		screenSize = var9,
		title = var10.title,
		bodyText = errorCode,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onClose, text = var10.OK }
				}
			}
		}
	})
end