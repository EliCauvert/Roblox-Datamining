local eventIngestService = game:GetService("EventIngestService")
local socialLuaAnalyticsModule = require(script:FindFirstAncestor("ProfileShareLinks").Parent.SocialLuaAnalytics)

return socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Telemetry = require(script.Parent.TelemetryActionList)
	},
	analyticsImpl = {
		EventStream = {
			sendEventDeferred = require(script.Parent.setupSendEventDeferred)(eventIngestService),
			setRBXEventStream = require(script.Parent.setupSetRbxEventStream)(eventIngestService)
		},
		Telemetry = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Telemetry
	}
})