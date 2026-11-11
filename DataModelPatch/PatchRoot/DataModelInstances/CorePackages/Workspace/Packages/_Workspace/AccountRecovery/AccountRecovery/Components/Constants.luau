return {
	UnknownErrorKey = "Authentication.AccountRecovery.MessageUnknownError",
	VerificationCodeLength = 6,
	BackupCodeLength = 9,
	SecondsBetweenResends = require(script:FindFirstAncestor("AccountRecovery").Parent.SharedFlags).GetFIntAccountRecoverySecondsBetweenResends()
}