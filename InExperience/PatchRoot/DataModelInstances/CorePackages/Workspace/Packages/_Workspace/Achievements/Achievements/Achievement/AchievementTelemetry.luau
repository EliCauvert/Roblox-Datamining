local loggingProtocolModule = require(script:FindFirstAncestor("Achievements").Parent.LoggingProtocol)
game:DefineFastInt("AchievementGrantedThrottleHundrethsPercent", 0)

return {
	eventName = "AchievementGranted",
	description = "Report whenever an achievement is granted to Points with document name \"achievementgranted\"",
	backends = { loggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:GetFastInt("AchievementGrantedThrottleHundrethsPercent"),
	lastUpdated = { 24, 7, 3 }
}