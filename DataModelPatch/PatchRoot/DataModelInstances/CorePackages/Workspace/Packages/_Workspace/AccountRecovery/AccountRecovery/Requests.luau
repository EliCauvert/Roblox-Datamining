return {
	PostRequestRecovery = require(script.PostRequestRecovery),
	PostSendCode = require(script.PostSendCode),
	PostResendCode = require(script.PostResendCode),
	PostVerifyCode = require(script.PostVerifyCode),
	PostVerifyBackupCode = require(script.PostVerifyBackupCode),
	PostRecoverySessionMetadata = require(script.PostRecoverySessionMetadata),
	PostSetEmail = require(script.PostSetEmail),
	GetPhonePrefixList = require(script.GetPhonePrefixList),
	GetCurrentTwoStepMethod = require(script.GetCurrentTwoStepMethod),
	PostDisableTwoStepMethod = require(script.PostDisableTwoStepMethod)
}