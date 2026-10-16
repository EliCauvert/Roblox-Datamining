local LoggingProtocolModule = require(script:FindFirstAncestor("AuthCommon").Parent.LoggingProtocol)
game:DefineFastInt("LoginByPhoneSSOErrorsThrottleHundrethsPercent", 0)

return {
	eventName = "LoginByPhoneSSOErrors",
	description = "Report LoginByPhoneSSO Error codes to Points with document name \"loginbyphonessoerrors\"",
	backends = { LoggingProtocolModule.TelemetryBackends.Points },
	throttlingPercentage = game:GetFastInt("LoginByPhoneSSOErrorsThrottleHundrethsPercent"),
	lastUpdated = { 26, 10, 5 }
}