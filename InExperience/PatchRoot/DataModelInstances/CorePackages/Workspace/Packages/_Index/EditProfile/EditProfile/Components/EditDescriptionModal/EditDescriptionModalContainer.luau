local editProfile = script:FindFirstAncestor("EditProfile")
local editDescriptionModalModule = require(script.Parent.EditDescriptionModal)
local parent = editProfile.Parent
local reactModule = require(parent.React)
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local usersNetworkingModule = require(editProfile.Networking.UsersNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(editProfile.Common.TextKeys)
local httpService = game:GetService("HttpService")
local editProfileIXPModule = require(editProfile.Flags.EditProfileIXP)
local analyticsModule = require(editProfile.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics

return function(p0) --[[ line: 36 | named "EditDescriptionModalContainer" ]]
	-- upvalues: useDispatch (ref), useScreenSize (ref), useLocalUserId (ref), reactModule (ref), editProfileIXPModule (ref), useAnalytics (ref), useLocalization (ref), textKeysModule (ref), usersNetworkingModule (ref), getDeepValue (ref), httpService (ref), eventNames (ref), editDescriptionModalModule (ref)
	local var8 = useDispatch()
	local var9 = useScreenSize()
	local var10 = useLocalUserId()
	local setDescription = p0.navigation.getParam("setDescription")
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16 = if if p0.IXPNotEnabled then false else editProfileIXPModule.useIsExperimentEnabled() then useAnalytics() else nil
	local var17 = useLocalization({
		About = textKeysModule.About,
		Caption = textKeysModule.AboutModalCaption,
		ThrottleError = textKeysModule.TooManyAttemptsTryAgainLater
	})
	
	return reactModule.createElement(editDescriptionModalModule, {
		screenSize = var9,
		title = var17.About,
		description = var17.Caption,
		throttleErrorText = var17.ThrottleError,
		initialText = p0.navigation.getParam("initialText"),
		cancelOnActivated = function() --[[ line: 55 ]]
			-- upvalues: p0 (ref)
			p0.navigation.goBack()
		end,
		saveOnActivated = function(p1) --[[ line: 59 ]]
			-- upvalues: var8 (ref), usersNetworkingModule (copy), var10 (ref), setDescription (ref), getDeepValue (copy), p0 (ref), httpService (copy), var16 (ref), eventNames (copy), var13 (ref), var15 (ref)
			return var8(usersNetworkingModule.SetDescription.API(var10, p1)):andThen(function(p3) --[[ line: 61 ]]
				-- upvalues: setDescription (copy), getDeepValue (copy), p0 (copy)
				setDescription(getDeepValue(p3, "responseBody.description"))
				p0.navigation.goBack()
			end):catch(function(p2) --[[ line: 65 ]]
				-- upvalues: httpService (copy), var16 (copy), eventNames (copy), var13 (copy), var15 (copy)
				local body = httpService:JSONDecode(p2.Body)
				
				if body.errors[1].code == 2 then
					if var16 then
						var16.fireAnalyticsEvent(eventNames.DescriptionPINBlocked)
					end
					var13(true)
					
					return
				elseif body.errors[1].code == 0 then
					var15(true)
				end
			end)
		end,
		textError = var12,
		throttleError = var14
	})
end