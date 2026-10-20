return {
	RequestRecovery = require(script.RequestRecovery),
	SendCode = require(script.SendCode),
	ResendCode = require(script.ResendCode),
	VerifyCode = require(script.VerifyCode),
	VerifyBackupCode = require(script.VerifyBackupCode),
	RecoverySessionMetadata = require(script.RecoverySessionMetadata),
	SetEmail = require(script.SetEmail),
	PhonePrefixList = require(script.PhonePrefixList),
	ConfirmPasswordValidator = require(script.ConfirmPasswordValidator),
	EmailValidator = require(script.EmailValidator),
	GetCurrentTwoStepMethod = require(script.GetCurrentTwoStepMethod),
	DisableTwoStepMethod = require(script.DisableTwoStepMethod)
}