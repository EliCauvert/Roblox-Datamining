local telemetryService = game:GetService("TelemetryService")
local default = require(script:FindFirstAncestor("ProgressLoading").Parent.LoggingProtocol).default
local progressLoadingTelemetryThrottleHundredthsPercent = game:DefineFastInt("ProgressLoadingTelemetryThrottleHundredthsPercent", 10000)
local t = {
	eventName = "progress_loading_assets_activated",
	description = "Counter for deferred asset loading screen activations",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = progressLoadingTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}
local t_1 = {
	eventName = "progress_loading_assets_deactivated",
	description = "Counter for deferred asset loading screen deactivations",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = progressLoadingTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}
local t_2 = {
	eventName = "progress_loading_assets_duration_ms",
	description = "Duration in ms that the deferred asset loading screen was shown",
	backends = { "RobloxTelemetryStat" },
	throttlingPercentage = progressLoadingTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 8 }
}
local var1 = nil

return {
	logLoadingAssetsActivated = function()
		-- upvalues: var1 (write), telemetryService (ref), t (ref), default (ref)
		var1 = os.clock()
		telemetryService:LogCounter(t, {}, 1)
		default:logEvent("progress_loading_assets_activated")
	end,
	logLoadingAssetsDeactivated = function()
		-- upvalues: var1 (write), telemetryService (ref), t_1 (ref), t_2 (ref), default (ref)
		assert(var1 ~= nil, "logLoadingAssetsDeactivated called without a prior logLoadingAssetsActivated")
		local floored = math.floor((os.clock() - var1) * 1000)
		var1 = nil
		telemetryService:LogCounter(t_1, {}, 1)
		telemetryService:LogStat(t_2, {}, floored)
		default:logEvent("progress_loading_assets_deactivated")
	end
}