local parent = script:FindFirstAncestor("MomentsCommon").Parent

return require(parent.SocialLuaAnalytics).Telemetry.createEmitter({
	shouldUseTelemetryService = false,
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = { throttlingThousandths = 10000, links = "" },
	getSharedInfo = function()
		return {}
	end
})