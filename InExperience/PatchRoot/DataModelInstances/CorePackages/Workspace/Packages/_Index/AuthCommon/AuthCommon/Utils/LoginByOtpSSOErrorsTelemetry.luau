local LoggingProtocolModule = require(script:FindFirstAncestor("AuthCommon").Parent.LoggingProtocol)
game:DefineFastInt("LoginByOtpSSOErrorsThrottleHundrethsPercent", 0)

return {
	eventName = "LoginByOtpSSOErrors",
	description = "Report LoginByOtp SSO error codes to Points with document name \"loginbyotpssoerrors\"",
	backends = { LoggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:GetFastInt("LoginByOtpSSOErrorsThrottleHundrethsPercent"),
	lastUpdated = { 26, 10, 20 }
}