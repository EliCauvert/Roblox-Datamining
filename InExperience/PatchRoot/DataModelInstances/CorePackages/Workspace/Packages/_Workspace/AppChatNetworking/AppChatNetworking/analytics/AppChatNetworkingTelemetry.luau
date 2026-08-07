local parent = script:FindFirstAncestor("AppChatNetworking").Parent

return require(parent.SocialLuaAnalytics).Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "",
		throttlingThousandths = game:DefineFastInt("AppChatNetworkingTelemetryThrottlingThousandths", 800)
	},
	getSharedInfo = function() --[[ line: 13 ]]
		return {}
	end
})