local _ = require(script.Parent.telemetryNewConfig)
local fireTelemetryModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.FireEvent.fireTelemetry)
local socialLuaAnalyticsUseTelemetryServiceAsDefault = game:DefineFastFlag("SocialLuaAnalyticsUseTelemetryServiceAsDefault", false)

return function(value) --[[ line: 34 | named "telemetrySetup" ]]
	-- upvalues: socialLuaAnalyticsUseTelemetryServiceAsDefault (ref), fireTelemetryModule (ref)
	local var2 = if value.shouldUseTelemetryService ~= nil then socialLuaAnalyticsUseTelemetryServiceAsDefault else value.shouldUseTelemetryService
	
	local function emitTelemetry(p0, p1) --[[ line: 39 ]]
		-- upvalues: fireTelemetryModule (copy), value (ref), var2 (ref)
		return fireTelemetryModule({
			telemetryImpl = value.telemetryImpl,
			eventList = { defaults = value.defaultTelemetryConfig, [p0.name] = p0 },
			loggerImpl = value.loggerImpl,
			shouldUseTelemetryService = var2,
			telemetryServiceImpl = value.telemetryServiceImpl
		})(p0.name, p1, if value.getSharedInfo then value.getSharedInfo() else {}, p0.eventStreamCtx)
	end
	
	return {
		emit = emitTelemetry,
		fireAnalyticsEvent = emitTelemetry,
		getSharedInfo = value.getSharedInfo
	}
end