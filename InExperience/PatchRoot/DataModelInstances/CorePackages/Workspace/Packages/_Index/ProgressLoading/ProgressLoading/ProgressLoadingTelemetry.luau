local TelemetryService = game:GetService("TelemetryService")
local Default = require(script:FindFirstAncestor("ProgressLoading").Parent.LoggingProtocol).default
local ProgressLoadingTelemetryThrottleHundredthsPercent = game:DefineFastInt("ProgressLoadingTelemetryThrottleHundredthsPercent", 10000)
local config = {
	eventName = "progress_loading_assets_activated",
	description = "Counter for deferred asset loading screen activations",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = ProgressLoadingTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}
local config1 = {
	eventName = "progress_loading_assets_deactivated",
	description = "Counter for deferred asset loading screen deactivations",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = ProgressLoadingTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}
local config2 = {
	eventName = "progress_loading_assets_duration_ms",
	description = "Duration in ms that the deferred asset loading screen was shown",
	backends = { "RobloxTelemetryStat" },
	throttlingPercentage = ProgressLoadingTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}
local ClockTime = nil

return {
	logLoadingAssetsActivated = function() --[[ Line: 41 ]]
		-- upvalues: ClockTime (ref), TelemetryService (copy), config (copy), Default (copy)
		ClockTime = os.clock()
		TelemetryService:LogCounter(config, {}, 1)
		Default:logEvent("progress_loading_assets_activated")
	end,
	logLoadingAssetsDeactivated = function() --[[ Line: 47 ]]
		-- upvalues: ClockTime (ref), TelemetryService (copy), config1 (copy), config2 (copy), Default (copy)
		assert(ClockTime ~= nil, "logLoadingAssetsDeactivated called without a prior logLoadingAssetsActivated")
		local Floored = math.floor((os.clock() - ClockTime) * 1000)
		ClockTime = nil
		TelemetryService:LogCounter(config1, {}, 1)
		TelemetryService:LogStat(config2, {}, Floored)
		Default:logEvent("progress_loading_assets_deactivated")
	end
}