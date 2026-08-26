local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local addRawValueMethodToEnumModule = require(genericChallenges.Utils.addRawValueMethodToEnum)
local t = {
	Captcha = "captcha",
	TwoStepVerification = "twostepverification",
	SecurityQuestions = "securityquestions",
	Reauthentication = "reauthentication",
	ProofOfWork = "proofofwork",
	ForceAuthenticator = "forceauthenticator",
	ForceTwoStepVerification = "forcetwostepverification",
	DeviceIntegrity = "deviceintegrity",
	DeviceAccessToken = "deviceaccesstoken",
	Denied = "denied",
	EmailVerification = "emailverification",
	PhoneVerification = "phoneverification",
	PrivateAccessToken = "privateaccesstoken",
	BlockSession = "blocksession",
	CaptchaV2 = "captchav2",
	Turnstile = "turnstile"
}
local var1 = require(genericChallenges.Parent.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var1, t)

return var1