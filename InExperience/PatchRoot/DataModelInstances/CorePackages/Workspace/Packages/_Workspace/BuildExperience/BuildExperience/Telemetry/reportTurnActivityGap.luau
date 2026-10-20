local TelemetryService = game:GetService("TelemetryService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local SendBuildExperienceStatModule = require(BuildExperience.Telemetry.sendBuildExperienceStat)
local FFlagBuildExperiencePromptFailureTelemetry = require(BuildExperience.Parent.SharedFlags).FFlagBuildExperiencePromptFailureTelemetry
game:DefineFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent", 0)
local Config = {
	eventName = "buildExperienceTurnActivityGapMs",
	description = "Milliseconds between visible chat-turn UI updates during a live CAS turn.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 6, 30 }
}

local function _(p1: number): boolean
	return p1 > 0 and (p1 >= 10000 or math.random(1, 10000) <= p1)
end

return {
	log = function(Value: number, IsFirstActivity, UniverseId)
		-- upvalues: FFlagBuildExperiencePromptFailureTelemetry (copy), SendBuildExperienceStatModule (copy), Config (copy), TelemetryService (copy)
		if FFlagBuildExperiencePromptFailureTelemetry then
			SendBuildExperienceStatModule({
				config = Config,
				sampleHundredthsPercent = game:GetFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent"),
				value = math.max(0, (math.round(Value))),
				customFields = {
					universeId = UniverseId,
					isFirstActivity = IsFirstActivity
				}
			})
			
			return
		end
		local BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt: number = game:GetFastInt("BuildExperienceTurnActivityGapMsThrottleHundredthsPercent")
		
		if BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt > 0 and (BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt >= 10000 or BuildExperienceTurnActivityGapMsThrottleHundredthsPercentFastInt >= math.random(1, 10000)) then
			TelemetryService:LogStat(Config, {
				customFields = {
					universeId = UniverseId,
					isFirstActivity = IsFirstActivity
				}
			}, (math.max(0, (math.floor(Value + 0.5)))))
			
			return
		end
	end,
	TurnActivityGapStatConfig = Config
}