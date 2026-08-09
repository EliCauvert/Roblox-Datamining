local parent = script:FindFirstAncestor("MomentsCommon").Parent

return require(parent.SocialLuaAnalytics).Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = { throttlingThousandths = 10000, links = "" },
	getSharedInfo = function() --[[ line: 31 ]]
		return {}
	end
})