local TelemetryService = game:GetService("TelemetryService")
game:DefineFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent", 0)
local TurnActivityGapStatConfig = {
	eventName = "buildExperienceTurnActivityGapMs",
	description = "Milliseconds between visible chat-turn UI updates during a live CAS turn.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 6, 30 }
}

local function _(p1: number): boolean
	return p1 > 0 and (p1 >= 10000 or math.random(1, 10000) <= p1)
end

return {
	log = function(p1: number, IsFirstActivity, UniverseId)
		-- upvalues: TelemetryService (copy), TurnActivityGapStatConfig (copy)
		local BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt: number = game:GetFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent")
		
		if BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt > 0 and (BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt >= 10000 or BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt >= math.random(1, 10000)) then
			TelemetryService:LogStat(TurnActivityGapStatConfig, {
				customFields = {
					universeId = UniverseId,
					isFirstActivity = IsFirstActivity
				}
			}, (math.max(0, (math.floor(p1 + 0.5)))))
			
			return
		end
	end,
	TurnActivityGapStatConfig = TurnActivityGapStatConfig
}