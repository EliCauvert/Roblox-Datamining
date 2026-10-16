local Parent = script:FindFirstAncestor("MomentsCommon").Parent

return require(Parent.SocialLuaAnalytics).Telemetry.createEmitter({
	shouldUseTelemetryService = false,
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = { throttlingThousandths = 10000, links = "" },
	getSharedInfo = function() --[[ Line: 15 ]]
		return {}
	end
})