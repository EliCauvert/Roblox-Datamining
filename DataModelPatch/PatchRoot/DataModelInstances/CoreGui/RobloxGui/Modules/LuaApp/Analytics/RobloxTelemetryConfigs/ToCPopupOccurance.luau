local LoggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
game:DefineFastInt("ToCPopupOccuranceThrottleHundrethsPercent", 0)

return {
	eventName = "ToCPopupOccurance",
	description = "Report ocurrance of ToC popup",
	backends = { LoggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:GetFastInt("ToCPopupOccuranceThrottleHundrethsPercent"),
	lastUpdated = { 23, 3, 8 }
}