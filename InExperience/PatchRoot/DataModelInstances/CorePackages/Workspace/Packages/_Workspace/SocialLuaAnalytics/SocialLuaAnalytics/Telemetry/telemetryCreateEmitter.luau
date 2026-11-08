local _ = require(script.Parent.telemetryNewConfig)
local FireTelemetryModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.FireEvent.fireTelemetry)

return function(p1)
	-- upvalues: FireTelemetryModule (copy)
	local NoShouldUseTelemetryService = p1.shouldUseTelemetryService == nil or p1.shouldUseTelemetryService
	
	local function emitTelemetry(p2, p3)
		-- upvalues: FireTelemetryModule (upval), p1 (copy), NoShouldUseTelemetryService (copy)
		return FireTelemetryModule({
			telemetryImpl = p1.telemetryImpl,
			eventList = { defaults = p1.defaultTelemetryConfig, [p2.name] = p2 },
			loggerImpl = p1.loggerImpl,
			shouldUseTelemetryService = NoShouldUseTelemetryService,
			telemetryServiceImpl = p1.telemetryServiceImpl
		})(p2.name, p3, if p1.getSharedInfo then p1.getSharedInfo() else {}, p2.eventStreamCtx)
	end
	
	return {
		emit = emitTelemetry,
		fireAnalyticsEvent = emitTelemetry,
		getSharedInfo = p1.getSharedInfo
	}
end