return {
	recoveryEventName = "accountSecurityFrontendAccountRecoveryEvent",
	context = {
		pageLoad = "pageLoad",
		recoveryInitializedFromAutofill = "recoveryInitializedFromAutofill",
		identifierSent = "identifierSent",
		contactMethodSent = "contactMethodSent",
		userSelected = "userSelected",
		passwordReset = "passwordReset",
		switchedToPhoneInput = "switchedToPhoneInput",
		switchedToEmailInput = "switchedToEmailInput",
		switchedToBackupCodeInput = "switchedToBackupCodeInput",
		backButtonClicked = "backButtonClicked",
		passwordUpdateAttempted = "passwordUpdateAttempted",
		passwordUpdateSuccess = "passwordUpdateSuccess",
		passwordUpdateFailure = "passwordUpdateFailure",
		passwordUpdateSkipped = "passwordUpdateSkipped"
	},
	passwordUpdateSkipReason = {
		featureDisabled = "featureDisabled",
		missingUsername = "missingUsername",
		missingPassword = "missingPassword",
		protocolNotAvailable = "protocolNotAvailable",
		availabilityCheckFailed = "availabilityCheckFailed"
	}
}