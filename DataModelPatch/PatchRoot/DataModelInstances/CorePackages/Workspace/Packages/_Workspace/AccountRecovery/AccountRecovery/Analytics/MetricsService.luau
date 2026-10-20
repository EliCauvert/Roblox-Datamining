local TelemetryService = game:GetService("TelemetryService")
local MetricsConstantsModule = require(script:FindFirstAncestor("AccountRecovery").Analytics.MetricsConstants)

return {
	reportTwoStepVerificationChallengeIDIsNil = function()
		-- upvalues: TelemetryService (copy), MetricsConstantsModule (copy)
		TelemetryService:LogCounter(MetricsConstantsModule.TwoStepVerificationChallengeIDIsNilConfig)
	end
}