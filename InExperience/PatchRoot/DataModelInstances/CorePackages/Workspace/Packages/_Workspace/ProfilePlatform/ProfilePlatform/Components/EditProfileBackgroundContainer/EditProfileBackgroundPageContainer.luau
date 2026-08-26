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

return function(_)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), refreshProfilePlatformUserInfoModule (ref), analytics (ref), defaultAnalyticsService (ref), editProfileBackgroundModule (ref)
	local var1 = useDispatch()
	local var2 = useLocalUserId()
	
	return reactModule.createElement(analytics.Context.Provider, {
		value = {
			fireAnalyticsEvent = analytics.setupFireAnalyticsEvents({
				analytics = {
					EventStream = defaultAnalyticsService.EventStream,
					Telemetry = defaultAnalyticsService.Telemetry
				},
				infoForAllEvents = { uid = tostring(var2) }
			})
		}
	}, {
		reactModule.createElement(editProfileBackgroundModule.EditProfileBackgroundPage, {
			onBackgroundChanged = reactModule.useCallback(function()
				-- upvalues: var1 (ref), refreshProfilePlatformUserInfoModule (copy), var2 (ref)
				var1(refreshProfilePlatformUserInfoModule(tostring(var2)))
			end),
			profileBackgroundData = useProfileJsonComponentModule(enumsModule.Components.ProfileBackground)
		})
	})
end