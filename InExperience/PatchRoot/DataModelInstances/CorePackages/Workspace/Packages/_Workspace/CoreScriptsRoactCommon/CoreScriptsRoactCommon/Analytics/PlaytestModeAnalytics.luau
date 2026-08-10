local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local t = {
	eventName = "playtest_mode_enabled",
	description = "Fires once when playtest mode becomes enabled for the local player",
	backends = {
		require(script:FindFirstAncestor("CoreScriptsRoactCommon").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("PlaytestModeEnabledEventThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 7, 23 }
}

local function _logEventWithStandardizedFields(p0, p1) --[[ line: 26 ]]
	-- upvalues: telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref)
	local list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	p1 = p1 or {}
	
	if telemetryServicePlaySessionInfoEnabledEngineFeature then
		table.insert(list, "addPlaySessionId")
	else
		p1.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	telemetryService:LogEvent(p0, { standardizedFields = list, customFields = p1 })
end

return {
	logPlaytestModeEnabled = function(p2) --[[ line: 42 ]]
		-- upvalues: _logEventWithStandardizedFields (ref), t (ref)
		_logEventWithStandardizedFields(t, { reason = p2 })
	end
}