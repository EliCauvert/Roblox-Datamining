local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local editProfileBackgroundModule = require(parent.EditProfileBackground)
local refreshProfilePlatformUserInfoModule = require(profilePlatform.Networking.refreshProfilePlatformUserInfo)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local enumsModule = require(profilePlatform.Common.Enums)
local defaultAnalyticsService = require(parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local analytics = require(parent.EditProfileBackground).Analytics

return function(_) --[[ line: 17 | named "EditProfileBackgroundPageWrapper" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), refreshProfilePlatformUserInfoModule (ref), analytics (ref), defaultAnalyticsService (ref), editProfileBackgroundModule (ref)
	local var6 = useDispatch()
	local var7 = useLocalUserId()
	
	return reactModule.createElement(analytics.Context.Provider, {
		value = {
			fireAnalyticsEvent = analytics.setupFireAnalyticsEvents({
				analytics = {
					EventStream = defaultAnalyticsService.EventStream,
					Telemetry = defaultAnalyticsService.Telemetry
				},
				infoForAllEvents = { uid = tostring(var7) }
			})
		}
	}, {
		reactModule.createElement(editProfileBackgroundModule.EditProfileBackgroundPage, {
			onBackgroundChanged = reactModule.useCallback(function() --[[ line: 23 ]]
				-- upvalues: var6 (ref), refreshProfilePlatformUserInfoModule (copy), var7 (ref)
				var6(refreshProfilePlatformUserInfoModule(tostring(var7)))
			end),
			profileBackgroundData = useProfileJsonComponentModule(enumsModule.Components.ProfileBackground)
		})
	})
end