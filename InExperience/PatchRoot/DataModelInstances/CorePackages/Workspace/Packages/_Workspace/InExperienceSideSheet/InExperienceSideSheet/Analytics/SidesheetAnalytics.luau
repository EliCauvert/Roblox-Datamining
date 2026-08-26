local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local t = {
	eventName = "sidesheet_closed",
	description = "Fires when the sidesheet is closed",
	backends = {
		require(script:FindFirstAncestor("InExperienceSideSheet").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("SidesheetClosedEventThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 4, 8 }
}

function _logEventWithStandardizedFields(p1, p2)
	-- upvalues: telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref)
	local list = {
		"addPlaceId",
		"addUniverseId",
		"addSessionInfo",
		"addOSInfo",
		"addMemoryInfo"
	}
	p2 = p2 or {}
	
	if telemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(list, "addPlaySessionId")
	else
		p2.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	telemetryService:LogEvent(p1, { standardizedFields = list, customFields = p2 })
end

function logSidesheetClosed(p1)
	-- upvalues: t (ref)
	_logEventWithStandardizedFields(t, { source = p1 })
end

return { logSidesheetClosed = logSidesheetClosed }