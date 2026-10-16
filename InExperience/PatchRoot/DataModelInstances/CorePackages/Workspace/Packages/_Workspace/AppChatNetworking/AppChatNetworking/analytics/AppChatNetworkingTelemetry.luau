local Parent = script:FindFirstAncestor("AppChatNetworking").Parent

return require(Parent.SocialLuaAnalytics).Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "",
		throttlingThousandths = game:DefineFastInt("AppChatNetworkingTelemetryThrottlingThousandths", 800)
	},
	getSharedInfo = function() --[[ Line: 13 ]]
		return {}
	end
})