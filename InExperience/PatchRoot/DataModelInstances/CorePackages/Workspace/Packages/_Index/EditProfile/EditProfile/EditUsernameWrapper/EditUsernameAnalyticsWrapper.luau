local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local editProfileIXPModule = require(editProfile.Flags.EditProfileIXP)
local analyticsModule = require(editProfile.Analytics)
local defaultAnalyticsService = require(parent.SocialLuaAnalytics).Analytics.DefaultAnalyticsService
local editUsernameWrapperModule = require(script.Parent.EditUsernameWrapper)

return function(p0) --[[ line: 13 ]]
	-- upvalues: useLocalUserId (ref), editProfileIXPModule (ref), reactModule (ref), analyticsModule (ref), defaultAnalyticsService (ref), editUsernameWrapperModule (ref)
	return if editProfileIXPModule.useIsExperimentEnabled() then reactModule.createElement(analyticsModule.Context.Provider, {
		value = {
			fireAnalyticsEvent = analyticsModule.setupFireAnalyticsEvents({
				analytics = defaultAnalyticsService,
				infoForAllEvents = { uid = useLocalUserId() }
			})
		}
	}, { reactModule.createElement(editUsernameWrapperModule, p0) }) else reactModule.createElement(editUsernameWrapperModule, p0)
end