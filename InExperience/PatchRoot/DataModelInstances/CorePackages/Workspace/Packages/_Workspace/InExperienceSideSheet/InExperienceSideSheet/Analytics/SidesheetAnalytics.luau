local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local config = {
	eventName = "sidesheet_closed",
	description = "Fires when the sidesheet is closed",
	backends = {
		require(script:FindFirstAncestor("InExperienceSideSheet").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("SidesheetClosedEventThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 4, 8 }
}

function _logEventWithStandardizedFields(Config, p1) --[[ Line: 26 ]]
	-- upvalues: TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy)
	local StandardizedFields = {
		"addPlaceId",
		"addUniverseId",
		"addSessionInfo",
		"addOSInfo",
		"addMemoryInfo"
	}
	local P1 = p1 or {}
	
	if TelemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(StandardizedFields, "addPlaySessionId")
	else
		P1.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	TelemetryService:LogEvent(Config, {
		standardizedFields = StandardizedFields,
		customFields = P1
	})
end

function logSidesheetClosed(Source) --[[ Line: 42 ]]
	-- upvalues: config (copy)
	_logEventWithStandardizedFields(config, { source = Source })
end

return { logSidesheetClosed = logSidesheetClosed }