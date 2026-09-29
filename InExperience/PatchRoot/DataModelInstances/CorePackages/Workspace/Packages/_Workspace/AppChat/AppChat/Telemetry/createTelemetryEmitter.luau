local parent = script:FindFirstAncestor("AppChat").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local loggingProtocolModule = require(parent.LoggingProtocol)
local loggerModule = require(script.Parent.Logger)

return function(p1)
	-- upvalues: socialLuaAnalyticsModule (ref), loggingProtocolModule (ref), loggerModule (ref)
	return socialLuaAnalyticsModule.Telemetry.createEmitter({
		shouldUseTelemetryService = true,
		telemetryImpl = loggingProtocolModule.default,
		loggerImpl = loggerModule,
		defaultTelemetryConfig = { throttlingThousandths = 10000, links = "example.com" },
		getSharedInfo = p1
	})
end