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

function _logEventWithStandardizedFields(p0, p1) --[[ line: 26 ]]
	-- upvalues: telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref)
	local list = {
		"addPlaceId",
		"addUniverseId",
		"addSessionInfo",
		"addOSInfo",
		"addMemoryInfo"
	}
	p1 = p1 or {}
	
	if telemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(list, "addPlaySessionId")
	else
		p1.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	telemetryService:LogEvent(p0, { standardizedFields = list, customFields = p1 })
end

function logSidesheetClosed(p2) --[[ line: 42 ]]
	-- upvalues: t (ref)
	_logEventWithStandardizedFields(t, { source = p2 })
end

return { logSidesheetClosed = logSidesheetClosed }