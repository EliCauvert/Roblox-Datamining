local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialOnboardingButtons").Parent.SocialLuaAnalytics)
local AnalyticsFactory = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local GetEventStreamActionListModule = require(script.getEventStreamActionList)
local DiagActionListModule = require(script.DiagActionList)

return {
	EventNames = require(script.EventNames),
	getAnalytics = function(p1)
		-- upvalues: GetEventStreamActionListModule (copy), AnalyticsFactory (copy), DiagActionListModule (copy), DefaultAnalyticsService (copy)
		return AnalyticsFactory.setUpAnalyticsFactory({
			eventLists = {
				EventStream = GetEventStreamActionListModule(p1),
				Diag = DiagActionListModule
			},
			analyticsImpl = {
				EventStream = DefaultAnalyticsService.EventStream,
				Diag = DefaultAnalyticsService.Diag
			}
		})
	end
}