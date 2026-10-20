local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local AnalyticsModule = require(EditProfile.Analytics)
local DefaultAnalyticsService = require(Parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local EditProfileEntryPointContainerModule = require(script.Parent.EditProfileEntryPointContainer)

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), ReactModule (copy), AnalyticsModule (copy), DefaultAnalyticsService (copy), EditProfileEntryPointContainerModule (copy)
	return ReactModule.createElement(AnalyticsModule.Context.Provider, {
		value = {
			fireAnalyticsEvent = AnalyticsModule.setupFireAnalyticsEvents({
				analytics = DefaultAnalyticsService,
				infoForAllEvents = { uid = UseLocalUserIdFunction() }
			})
		}
	}, {
		ReactModule.createElement(EditProfileEntryPointContainerModule, p1)
	})
end