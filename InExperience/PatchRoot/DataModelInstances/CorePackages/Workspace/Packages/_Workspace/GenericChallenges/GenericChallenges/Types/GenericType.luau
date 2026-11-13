local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local AddRawValueMethodToEnumModule: (any, any) -> () = require(GenericChallenges.Utils.addRawValueMethodToEnum)
local EnumerateModule = require(Parent.enumerate)
local config = {
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
	Turnstile = "turnstile",
	RoCaptcha = "rocaptcha"
}
local EnumerateModuleResult = EnumerateModule(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateModuleResult, config)

return EnumerateModuleResult