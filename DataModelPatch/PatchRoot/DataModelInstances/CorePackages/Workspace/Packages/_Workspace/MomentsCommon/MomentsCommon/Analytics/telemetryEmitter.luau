local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent

return require(Parent.SocialLuaAnalytics).Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	shouldUseTelemetryService = require(MomentsCommon.Flags.GetFFlagMomentsAnalyticsProducerPrereqs)(),
	defaultTelemetryConfig = { throttlingThousandths = 10000, links = "" },
	getSharedInfo = function()
		return {}
	end
})