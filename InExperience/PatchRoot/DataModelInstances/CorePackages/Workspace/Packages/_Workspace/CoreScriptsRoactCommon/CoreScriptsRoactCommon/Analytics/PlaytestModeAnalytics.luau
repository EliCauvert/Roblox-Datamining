local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local config = {
	eventName = "playtest_mode_enabled",
	description = "Fires once when playtest mode becomes enabled for the local player",
	backends = {
		require(script:FindFirstAncestor("CoreScriptsRoactCommon").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("PlaytestModeEnabledEventThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 7, 23 }
}

local function _logEventWithStandardizedFields(Config, p1) --[[ Line: 26 ]]
	-- upvalues: TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy)
	local StandardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
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

return {
	logPlaytestModeEnabled = function(Reason) --[[ Line: 42 ]]
		-- upvalues: _logEventWithStandardizedFields (copy), config (copy)
		_logEventWithStandardizedFields(config, { reason = Reason })
	end
}