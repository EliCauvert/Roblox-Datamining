local loggingProtocolModule = require(script:FindFirstAncestor("AuthCommon").Parent.LoggingProtocol)
game:DefineFastInt("LoginByUsernameSSOErrorsThrottleHundrethsPercent", 0)

return {
	eventName = "LoginByUsernameSSOErrors",
	description = "Report LoginByUsernameSSO Error codes to Points with document name \"loginbyusernamessoerrors\"",
	backends = { loggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:GetFastInt("LoginByUsernameSSOErrorsThrottleHundrethsPercent"),
	lastUpdated = { 24, 5, 3 }
}