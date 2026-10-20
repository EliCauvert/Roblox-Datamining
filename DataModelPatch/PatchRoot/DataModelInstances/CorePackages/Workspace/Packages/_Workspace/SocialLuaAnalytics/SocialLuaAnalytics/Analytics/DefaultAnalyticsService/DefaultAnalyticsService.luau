local Parent = script:FindFirstAncestor("SocialLuaAnalytics").Parent
local EventIngestService = game:GetService("EventIngestService")

return {
	EventStream = {
		setRBXEventStream = require(script.Parent.setupSetRbxEventStream)(EventIngestService),
		sendEventDeferred = require(script.Parent.setupSendEventDeferred)(EventIngestService)
	},
	Diag = require(Parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")).Diag,
	Telemetry = require(Parent.LoggingProtocol).default
}