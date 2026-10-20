local Parent = script:FindFirstAncestor("MomentsCommon").Parent

return require(Parent.SocialLuaAnalytics).Telemetry.createEmitter({
	shouldUseTelemetryService = true,
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = { throttlingThousandths = 10000, links = "" },
	getSharedInfo = function()
		return {}
	end
})