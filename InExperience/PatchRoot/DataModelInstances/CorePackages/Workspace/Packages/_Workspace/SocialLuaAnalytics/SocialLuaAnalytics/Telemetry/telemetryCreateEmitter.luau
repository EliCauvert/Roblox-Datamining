local _ = require(script.Parent.telemetryNewConfig)
local FireTelemetryModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.FireEvent.fireTelemetry)
local SocialLuaAnalyticsUseTelemetryServiceAsDefault = game:DefineFastFlag("SocialLuaAnalyticsUseTelemetryServiceAsDefault", false)

return function(p1) --[[ Line: 34 | Named "telemetrySetup" ]]
	-- upvalues: SocialLuaAnalyticsUseTelemetryServiceAsDefault (copy), FireTelemetryModule (copy)
	local SocialLuaAnalyticsUseTelemetryServiceAsDefault1 = if p1.shouldUseTelemetryService == nil then SocialLuaAnalyticsUseTelemetryServiceAsDefault else p1.shouldUseTelemetryService
	
	local function emitTelemetry(p2, p3) --[[ Line: 39 ]]
		-- upvalues: FireTelemetryModule (upval), p1 (copy), SocialLuaAnalyticsUseTelemetryServiceAsDefault1 (copy)
		return FireTelemetryModule({
			telemetryImpl = p1.telemetryImpl,
			eventList = { defaults = p1.defaultTelemetryConfig, [p2.name] = p2 },
			loggerImpl = p1.loggerImpl,
			shouldUseTelemetryService = SocialLuaAnalyticsUseTelemetryServiceAsDefault1,
			telemetryServiceImpl = p1.telemetryServiceImpl
		})(p2.name, p3, if p1.getSharedInfo then p1.getSharedInfo() else {}, p2.eventStreamCtx)
	end
	
	return {
		emit = emitTelemetry,
		fireAnalyticsEvent = emitTelemetry,
		getSharedInfo = p1.getSharedInfo
	}
end