local telemetryService = game:GetService("TelemetryService")
game:DefineFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent", 0)
local t = {
	eventName = "buildExperienceTurnActivityGapMs",
	description = "Milliseconds between visible chat-turn UI updates during a live CAS turn.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 6, 30 }
}

local function _(p0)
	return if p0 <= 0 then false else p0 >= 10000 or math.random(1, 10000) <= p0
end

return {
	log = function(p1, p2, p3)
		-- upvalues: telemetryService (ref), t (ref)
		local buildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt = game:GetFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent")
		
		if if buildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt <= 0 then false else buildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt >= 10000 or math.random(1, 10000) <= buildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt then
			telemetryService:LogStat(t, { customFields = { universeId = p3, isFirstActivity = p2 } }, math.max(0, math.floor(p1 + 0.5)))
			
			return
		end
	end,
	TurnActivityGapStatConfig = t
}