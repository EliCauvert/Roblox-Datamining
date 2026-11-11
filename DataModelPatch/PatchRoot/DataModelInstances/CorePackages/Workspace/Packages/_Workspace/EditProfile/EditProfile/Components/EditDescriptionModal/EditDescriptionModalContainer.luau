local EditProfile = script:FindFirstAncestor("EditProfile")
local EditDescriptionModalModule = require(script.Parent.EditDescriptionModal)
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UsersNetworkingModule = require(EditProfile.Networking.UsersNetworking)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(EditProfile.Common.TextKeys)
local HttpService = game:GetService("HttpService")
local EditProfileIXPModule = require(EditProfile.Flags.EditProfileIXP)
local AnalyticsModule = require(EditProfile.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseScreenSizeFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), EditProfileIXPModule (copy), UseAnalyticsFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UsersNetworkingModule (copy), GetDeepValueFunction (copy), HttpService (copy), EventNames (copy), EditDescriptionModalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local SetDescriptionParam = p1.navigation.getParam("setDescription")
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseIsExperimentEnabledResult = not p1.IXPNotEnabled and EditProfileIXPModule.useIsExperimentEnabled()
	local UseAnalyticsResult = if UseIsExperimentEnabledResult then UseAnalyticsFunction() else nil
	local UseLocalizationResult = UseLocalizationFunction({
		About = TextKeysModule.About,
		Caption = TextKeysModule.AboutModalCaption,
		ThrottleError = TextKeysModule.TooManyAttemptsTryAgainLater
	})
	
	return ReactModule.createElement(EditDescriptionModalModule, {
		screenSize = UseScreenSizeResult,
		title = UseLocalizationResult.About,
		description = UseLocalizationResult.Caption,
		throttleErrorText = UseLocalizationResult.ThrottleError,
		initialText = p1.navigation.getParam("initialText"),
		cancelOnActivated = function()
			-- upvalues: p1 (copy)
			p1.navigation.goBack()
		end,
		saveOnActivated = function(p2)
			-- upvalues: UseDispatchResult (copy), UsersNetworkingModule (upval), UseLocalUserIdResult (copy), SetDescriptionParam (copy), GetDeepValueFunction (upval), p1 (copy), HttpService (upval), UseAnalyticsResult (copy), EventNames (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
			return UseDispatchResult(UsersNetworkingModule.SetDescription.API(UseLocalUserIdResult, p2)):andThen(function(Result)
				-- upvalues: SetDescriptionParam (upval), GetDeepValueFunction (upval), p1 (upval)
				SetDescriptionParam(GetDeepValueFunction(Result, "responseBody.description"))
				p1.navigation.goBack()
			end):catch(function(Err)
				-- upvalues: HttpService (upval), UseAnalyticsResult (upval), EventNames (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
				local Data = HttpService:JSONDecode(Err.Body)
				
				if Data.errors[1].code == 2 then
					if UseAnalyticsResult then
						UseAnalyticsResult.fireAnalyticsEvent(EventNames.DescriptionPINBlocked)
					end
					UseStateResult2(true)
					
					return
				elseif Data.errors[1].code == 0 then
					UseStateResult2_1(true)
				end
			end)
		end,
		textError = UseStateResult,
		throttleError = UseStateResult1
	})
end