local EventIngestService = game:GetService("EventIngestService")
local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("ProfileShareLinks").Parent.SocialLuaAnalytics)

return SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Telemetry = require(script.Parent.TelemetryActionList)
	},
	analyticsImpl = {
		EventStream = {
			sendEventDeferred = require(script.Parent.setupSendEventDeferred)(EventIngestService),
			setRBXEventStream = require(script.Parent.setupSetRbxEventStream)(EventIngestService)
		},
		Telemetry = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Telemetry
	}
})