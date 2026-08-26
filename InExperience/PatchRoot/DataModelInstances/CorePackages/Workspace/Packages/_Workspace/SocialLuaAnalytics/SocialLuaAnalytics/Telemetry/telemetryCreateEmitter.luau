local _ = require(script.Parent.telemetryNewConfig)
local fireTelemetryModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.FireEvent.fireTelemetry)
local socialLuaAnalyticsUseTelemetryServiceAsDefault = game:DefineFastFlag("SocialLuaAnalyticsUseTelemetryServiceAsDefault", false)

return function(value)
	-- upvalues: socialLuaAnalyticsUseTelemetryServiceAsDefault (ref), fireTelemetryModule (ref)
	local var1 = if value.shouldUseTelemetryService ~= nil then socialLuaAnalyticsUseTelemetryServiceAsDefault else value.shouldUseTelemetryService
	
	local function emitTelemetry(p1, p2)
		-- upvalues: fireTelemetryModule (copy), value (ref), var1 (ref)
		return fireTelemetryModule({
			telemetryImpl = value.telemetryImpl,
			eventList = { defaults = value.defaultTelemetryConfig, [p1.name] = p1 },
			loggerImpl = value.loggerImpl,
			shouldUseTelemetryService = var1,
			telemetryServiceImpl = value.telemetryServiceImpl
		})(p1.name, p2, if value.getSharedInfo then value.getSharedInfo() else {}, p1.eventStreamCtx)
	end
	
	return {
		emit = emitTelemetry,
		fireAnalyticsEvent = emitTelemetry,
		getSharedInfo = value.getSharedInfo
	}
end