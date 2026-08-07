local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local analyticsModule = require(editProfile.Analytics)
local defaultAnalyticsService = require(parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local editProfileEntryPointContainerModule = require(script.Parent.EditProfileEntryPointContainer)

return function(p0) --[[ line: 11 ]]
	-- upvalues: useLocalUserId (ref), reactModule (ref), analyticsModule (ref), defaultAnalyticsService (ref), editProfileEntryPointContainerModule (ref)
	return reactModule.createElement(analyticsModule.Context.Provider, {
		value = {
			fireAnalyticsEvent = analyticsModule.setupFireAnalyticsEvents({
				analytics = defaultAnalyticsService,
				infoForAllEvents = { uid = useLocalUserId() }
			})
		}
	}, {
		reactModule.createElement(editProfileEntryPointContainerModule, p0)
	})
end