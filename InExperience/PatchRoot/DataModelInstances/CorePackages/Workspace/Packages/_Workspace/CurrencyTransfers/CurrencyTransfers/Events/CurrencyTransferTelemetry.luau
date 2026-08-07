local loggingProtocolModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.LoggingProtocol)
local currencyTransferTelemetryCounterThrottleHundredthsPercent = game:DefineFastInt("CurrencyTransferTelemetryCounterThrottleHundredthsPercent", 0)

return {
	CurrencyTransferFlowOpenedCounter = {
		eventName = "CurrencyTransferFlowOpenedCounter",
		description = "Counter fired when the currency transfer flow is opened.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferInitiateSucceededCounter = {
		eventName = "CurrencyTransferInitiateSucceededCounter",
		description = "Counter fired when initiate transfer API succeeds and the send flow reaches input.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferInitiateFailedCounter = {
		eventName = "CurrencyTransferInitiateFailedCounter",
		description = "Counter fired when initiate transfer API fails.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferProcessAttemptedCounter = {
		eventName = "CurrencyTransferProcessAttemptedCounter",
		description = "Counter fired when process transfer is attempted (send).",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferProcessSucceededCounter = {
		eventName = "CurrencyTransferProcessSucceededCounter",
		description = "Counter fired when process transfer API reports success.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferProcessFailedCounter = {
		eventName = "CurrencyTransferProcessFailedCounter",
		description = "Counter fired when process transfer fails or is invalid (send).",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAcceptAttemptedCounter = {
		eventName = "CurrencyTransferAcceptAttemptedCounter",
		description = "Counter fired when accept transfer API is invoked (receive).",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAcceptSucceededCounter = {
		eventName = "CurrencyTransferAcceptSucceededCounter",
		description = "Counter fired when accept transfer API succeeds.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAcceptFailedCounter = {
		eventName = "CurrencyTransferAcceptFailedCounter",
		description = "Counter fired when accept transfer fails or is invalid (receive).",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferAmpRecourseRequiredCounter = {
		eventName = "CurrencyTransferAmpRecourseRequiredCounter",
		description = "Counter fired when AMP recourse blocks the transfer flow.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferInputSheetShownCounter = {
		eventName = "CurrencyTransferInputSheetShownCounter",
		description = "Counter fired when the send transfer input sheet is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferConfirmSheetShownCounter = {
		eventName = "CurrencyTransferConfirmSheetShownCounter",
		description = "Counter fired when the send transfer confirm sheet is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferFAEBlockSheetShownCounter = {
		eventName = "CurrencyTransferFAEBlockSheetShownCounter",
		description = "Counter fired when the FAE (age verification) block sheet is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferFAEBlockContinueClickedCounter = {
		eventName = "CurrencyTransferFAEBlockContinueClickedCounter",
		description = "Counter fired when the user taps Continue on the FAE block sheet.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferVPCBlockDialogShownCounter = {
		eventName = "CurrencyTransferVPCBlockDialogShownCounter",
		description = "Counter fired when the VPC (parent consent) block dialog is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferVPCBlockAskClickedCounter = {
		eventName = "CurrencyTransferVPCBlockAskClickedCounter",
		description = "Counter fired when the user taps Ask on the VPC block dialog.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferVPCBlockCancelClickedCounter = {
		eventName = "CurrencyTransferVPCBlockCancelClickedCounter",
		description = "Counter fired when the user taps Cancel on the VPC block dialog.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferSubscriptionUpsellWizardOpenedCounter = {
		eventName = "CurrencyTransferSubscriptionUpsellWizardOpenedCounter",
		description = "Counter fired when the Plus subscription upsell AMP wizard is opened from the transfer flow.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter = {
		eventName = "CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter",
		description = "Counter fired when the subscription upsell wizard completes with access granted.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter = {
		eventName = "CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter",
		description = "Counter fired when the subscription upsell wizard completes without access granted.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 19 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferEngineSignalReceivedCounter = {
		eventName = "CurrencyTransferEngineSignalReceivedCounter",
		description = "Counter fired when the PromptRobuxTransferRequested engine signal is received and decoded.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 4, 1 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	},
	CurrencyTransferEngineUpsellSignalReceivedCounter = {
		eventName = "CurrencyTransferEngineUpsellSignalReceivedCounter",
		description = "Counter fired when the PromptRobuxTransferSubscriptionUpsellRequested engine signal is received.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 5, 13 },
		throttlingPercentage = currencyTransferTelemetryCounterThrottleHundredthsPercent
	}
}