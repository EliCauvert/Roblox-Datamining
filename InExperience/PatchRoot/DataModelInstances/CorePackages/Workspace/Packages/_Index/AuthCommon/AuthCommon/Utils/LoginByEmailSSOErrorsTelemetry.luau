local LoggingProtocolModule = require(script:FindFirstAncestor("AuthCommon").Parent.LoggingProtocol)
game:DefineFastInt("LoginByEmailSSOErrorsThrottleHundrethsPercent", 0)

return {
	eventName = "LoginByEmailSSOErrors",
	description = "Report LoginByEmail SSO error codes to Points with document name \"loginbyemailssoerrors\"",
	backends = { LoggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:GetFastInt("LoginByEmailSSOErrorsThrottleHundrethsPercent"),
	lastUpdated = { 26, 10, 5 }
}