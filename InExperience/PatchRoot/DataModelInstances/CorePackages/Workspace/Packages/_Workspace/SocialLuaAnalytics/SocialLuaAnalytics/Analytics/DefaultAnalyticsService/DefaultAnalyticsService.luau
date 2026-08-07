local parent = script:FindFirstAncestor("SocialLuaAnalytics").Parent
local eventIngestService = game:GetService("EventIngestService")

return {
	EventStream = {
		setRBXEventStream = require(script.Parent.setupSetRbxEventStream)(eventIngestService),
		sendEventDeferred = require(script.Parent.setupSendEventDeferred)(eventIngestService)
	},
	Diag = require(parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")).Diag,
	Telemetry = require(parent.LoggingProtocol).default
}