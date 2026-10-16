local Parent = script:FindFirstAncestor("AppChat").Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local LoggerModule = require(script.Parent.Logger)

return function(GetSharedInfo) --[[ Line: 8 ]]
	-- upvalues: SocialLuaAnalyticsModule (copy), LoggingProtocolModule (copy), LoggerModule (copy)
	return SocialLuaAnalyticsModule.Telemetry.createEmitter({
		shouldUseTelemetryService = true,
		telemetryImpl = LoggingProtocolModule.default,
		loggerImpl = LoggerModule,
		defaultTelemetryConfig = { throttlingThousandths = 10000, links = "example.com" },
		getSharedInfo = GetSharedInfo
	})
end