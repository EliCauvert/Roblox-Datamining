local Parent = script:FindFirstAncestor("AppChat").Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local LoggerModule = require(script.Parent.Logger)
local AppChatAnalyticsUseTelemetryService = game:DefineFastFlag("AppChatAnalyticsUseTelemetryService", false)

return function(GetSharedInfo)
	-- upvalues: SocialLuaAnalyticsModule (copy), LoggingProtocolModule (copy), LoggerModule (copy), AppChatAnalyticsUseTelemetryService (copy)
	return SocialLuaAnalyticsModule.Telemetry.createEmitter({
		telemetryImpl = LoggingProtocolModule.default,
		loggerImpl = LoggerModule,
		defaultTelemetryConfig = { throttlingThousandths = 10000, links = "example.com" },
		getSharedInfo = GetSharedInfo,
		shouldUseTelemetryService = AppChatAnalyticsUseTelemetryService
	})
end