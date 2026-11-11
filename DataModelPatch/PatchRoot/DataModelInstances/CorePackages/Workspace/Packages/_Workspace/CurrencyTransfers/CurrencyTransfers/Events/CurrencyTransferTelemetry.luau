local LoggingProtocolModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.LoggingProtocol)
local CurrencyTransferTelemetryCounterThrottleHundredthsPercent = game:DefineFastInt("CurrencyTransferTelemetryCounterThrottleHundredthsPercent", 0)

return {
	CurrencyTransferFlowOpenedCounter = {
		eventName = "CurrencyTransferFlowOpenedCounter",
		description = "Counter fired when the currency transfer flow is opened.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferInitiateSucceededCounter = {
		eventName = "CurrencyTransferInitiateSucceededCounter",
		description = "Counter fired when initiate transfer API succeeds and the send flow reaches input.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferInitiateFailedCounter = {
		eventName = "CurrencyTransferInitiateFailedCounter",
		description = "Counter fired when initiate transfer API fails.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferProcessAttemptedCounter = {
		eventName = "CurrencyTransferProcessAttemptedCounter",
		description = "Counter fired when process transfer is attempted (send).",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferProcessSucceededCounter = {
		eventName = "CurrencyTransferProcessSucceededCounter",
		description = "Counter fired when process transfer API reports success.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferProcessFailedCounter = {
		eventName = "CurrencyTransferProcessFailedCounter",
		description = "Counter fired when process transfer fails or is invalid (send).",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAcceptAttemptedCounter = {
		eventName = "CurrencyTransferAcceptAttemptedCounter",
		description = "Counter fired when accept transfer API is invoked (receive).",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAcceptSucceededCounter = {
		eventName = "CurrencyTransferAcceptSucceededCounter",
		description = "Counter fired when accept transfer API succeeds.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAcceptFailedCounter = {
		eventName = "CurrencyTransferAcceptFailedCounter",
		description = "Counter fired when accept transfer fails or is invalid (receive).",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAmpRecourseRequiredCounter = {
		eventName = "CurrencyTransferAmpRecourseRequiredCounter",
		description = "Counter fired when AMP recourse blocks the transfer flow.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferInputSheetShownCounter = {
		eventName = "CurrencyTransferInputSheetShownCounter",
		description = "Counter fired when the send transfer input sheet is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferConfirmSheetShownCounter = {
		eventName = "CurrencyTransferConfirmSheetShownCounter",
		description = "Counter fired when the send transfer confirm sheet is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferFAEBlockSheetShownCounter = {
		eventName = "CurrencyTransferFAEBlockSheetShownCounter",
		description = "Counter fired when the FAE (age verification) block sheet is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferFAEBlockContinueClickedCounter = {
		eventName = "CurrencyTransferFAEBlockContinueClickedCounter",
		description = "Counter fired when the user taps Continue on the FAE block sheet.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferVPCBlockDialogShownCounter = {
		eventName = "CurrencyTransferVPCBlockDialogShownCounter",
		description = "Counter fired when the VPC (parent consent) block dialog is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferVPCBlockAskClickedCounter = {
		eventName = "CurrencyTransferVPCBlockAskClickedCounter",
		description = "Counter fired when the user taps Ask on the VPC block dialog.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferVPCBlockCancelClickedCounter = {
		eventName = "CurrencyTransferVPCBlockCancelClickedCounter",
		description = "Counter fired when the user taps Cancel on the VPC block dialog.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferSubscriptionUpsellWizardOpenedCounter = {
		eventName = "CurrencyTransferSubscriptionUpsellWizardOpenedCounter",
		description = "Counter fired when the Plus subscription upsell AMP wizard is opened from the transfer flow.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter = {
		eventName = "CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter",
		description = "Counter fired when the subscription upsell wizard completes with access granted.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter = {
		eventName = "CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter",
		description = "Counter fired when the subscription upsell wizard completes without access granted.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferEngineSignalReceivedCounter = {
		eventName = "CurrencyTransferEngineSignalReceivedCounter",
		description = "Counter fired when the PromptRobuxTransferRequested engine signal is received and decoded.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 4, 1 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferEngineUpsellSignalReceivedCounter = {
		eventName = "CurrencyTransferEngineUpsellSignalReceivedCounter",
		description = "Counter fired when the PromptRobuxTransferSubscriptionUpsellRequested engine signal is received.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 5, 13 },
		throttlingPercentage = CurrencyTransferTelemetryCounterThrottleHundredthsPercent
	}
}