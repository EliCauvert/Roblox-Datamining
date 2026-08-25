local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent

return require(parent.SocialLuaAnalytics).Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	shouldUseTelemetryService = require(momentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)(),
	defaultTelemetryConfig = { throttlingThousandths = 10000, links = "" },
	getSharedInfo = function()
		return {}
	end
})