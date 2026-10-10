local buildExperience = script:FindFirstAncestor("BuildExperience")
local fIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercentModule = require(buildExperience.Flags.FIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercent)
local sendBuildExperienceStatModule = require(buildExperience.Telemetry.sendBuildExperienceStat)
local t = {
	eventName = "buildExperiencePromptFirstResponseMs",
	description = "Milliseconds from sending a Build chat prompt to its first visible response (agent text or tool activity), including backend retries.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 10, 8 }
}

return function(p1, p2)
	-- upvalues: sendBuildExperienceStatModule (ref), t (ref), fIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercentModule (ref)
	sendBuildExperienceStatModule({
		config = t,
		sampleHundredthsPercent = fIntBuildExperiencePromptFirstResponseMsThrottleHundredthsPercentModule,
		value = math.max(0, math.round(p1)),
		customFields = { stalled = p2 }
	})
end