local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialExperienceJoin").Parent.SocialLuaAnalytics)
local AnalyticsFactory = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local GetEventStreamActionListModule = require(script.Parent.getEventStreamActionList)
local TelemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: GetEventStreamActionListModule (copy), AnalyticsFactory (copy), TelemetryActionListModule (copy), DefaultAnalyticsService (copy)
	return AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = GetEventStreamActionListModule(p1),
			Telemetry = TelemetryActionListModule
		},
		analyticsImpl = {
			EventStream = DefaultAnalyticsService.EventStream,
			Telemetry = DefaultAnalyticsService.Telemetry
		}
	})()
end