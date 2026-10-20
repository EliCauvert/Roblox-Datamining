local BuildExperience = script:FindFirstAncestor("BuildExperience")
local FIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercentModule = require(BuildExperience.Flags.FIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercent)
local SendBuildExperienceStatModule = require(BuildExperience.Telemetry.sendBuildExperienceStat)
local Config = {
	eventName = "buildExperiencePromptFirstResponseMs",
	description = "Milliseconds from sending a Build chat prompt to its first visible response (agent text or tool activity), including backend retries.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 10, 8 }
}

return function(Value: number, Stalled)
	-- upvalues: SendBuildExperienceStatModule (copy), Config (copy), FIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercentModule (copy)
	SendBuildExperienceStatModule({
		config = Config,
		sampleHundredthsPercent = FIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercentModule,
		value = math.max(0, (math.round(Value))),
		customFields = { stalled = Stalled }
	})
end