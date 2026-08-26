local parent = script:FindFirstAncestor("AppChat").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local loggingProtocolModule = require(parent.LoggingProtocol)
local loggerModule = require(script.Parent.Logger)
local appChatAnalyticsUseTelemetryService = game:DefineFastFlag("AppChatAnalyticsUseTelemetryService", false)

return function(p1)
	-- upvalues: socialLuaAnalyticsModule (ref), loggingProtocolModule (ref), loggerModule (ref), appChatAnalyticsUseTelemetryService (ref)
	return socialLuaAnalyticsModule.Telemetry.createEmitter({
		telemetryImpl = loggingProtocolModule.default,
		loggerImpl = loggerModule,
		defaultTelemetryConfig = { throttlingThousandths = 10000, links = "example.com" },
		getSharedInfo = p1,
		shouldUseTelemetryService = appChatAnalyticsUseTelemetryService
	})
end