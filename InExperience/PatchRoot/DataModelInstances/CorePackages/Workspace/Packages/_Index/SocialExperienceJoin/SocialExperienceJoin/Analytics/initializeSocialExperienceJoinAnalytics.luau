local socialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics)
local analyticsFactory = socialLuaAnalyticsModule.Analytics.AnalyticsFactory
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local getEventStreamActionListModule = require(script.Parent.getEventStreamActionList)
local telemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p1)
	-- upvalues: getEventStreamActionListModule (ref), analyticsFactory (ref), telemetryActionListModule (ref), defaultAnalyticsService (ref)
	return analyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = getEventStreamActionListModule(p1),
			Telemetry = telemetryActionListModule
		},
		analyticsImpl = {
			EventStream = defaultAnalyticsService.EventStream,
			Telemetry = defaultAnalyticsService.Telemetry
		}
	})()
end