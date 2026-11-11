local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local EditProfileIXPModule = require(EditProfile.Flags.EditProfileIXP)
local AnalyticsModule = require(EditProfile.Analytics)
local DefaultAnalyticsService = require(Parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local EditUsernameWrapperModule = require(script.Parent.EditUsernameWrapper)

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), EditProfileIXPModule (copy), ReactModule (copy), AnalyticsModule (copy), DefaultAnalyticsService (copy), EditUsernameWrapperModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	
	return if EditProfileIXPModule.useIsExperimentEnabled() then ReactModule.createElement(AnalyticsModule.Context.Provider, {
		value = {
			fireAnalyticsEvent = AnalyticsModule.setupFireAnalyticsEvents({
				analytics = DefaultAnalyticsService,
				infoForAllEvents = { uid = UseLocalUserIdResult }
			})
		}
	}, { ReactModule.createElement(EditUsernameWrapperModule, p1) }) else ReactModule.createElement(EditUsernameWrapperModule, p1)
end