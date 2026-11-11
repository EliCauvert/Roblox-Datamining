local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local EditProfileBackgroundModule = require(Parent.EditProfileBackground)
local RefreshProfilePlatformUserInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local DefaultAnalyticsService = require(Parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local Analytics = require(Parent.EditProfileBackground).Analytics

return function(_)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), RefreshProfilePlatformUserInfoModule (copy), Analytics (copy), DefaultAnalyticsService (copy), EditProfileBackgroundModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	
	return ReactModule.createElement(Analytics.Context.Provider, {
		value = {
			fireAnalyticsEvent = Analytics.setupFireAnalyticsEvents({
				analytics = {
					EventStream = DefaultAnalyticsService.EventStream,
					Telemetry = DefaultAnalyticsService.Telemetry
				},
				infoForAllEvents = { uid = tostring(UseLocalUserIdResult) }
			})
		}
	}, {
		ReactModule.createElement(EditProfileBackgroundModule.EditProfileBackgroundPage, {
			onBackgroundChanged = ReactModule.useCallback(function()
				-- upvalues: UseDispatchResult (copy), RefreshProfilePlatformUserInfoModule (upval), UseLocalUserIdResult (copy)
				UseDispatchResult(RefreshProfilePlatformUserInfoModule((tostring(UseLocalUserIdResult))))
			end),
			profileBackgroundData = UseProfileJsonComponentModule(EnumsModule.Components.ProfileBackground)
		})
	})
end