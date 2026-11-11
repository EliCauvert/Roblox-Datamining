local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local config = {
	Captcha = "captcha",
	TwoStepVerification = "two-step-verification",
	SecurityQuestions = "security-questions",
	Reauthentication = "reauthentication",
	Generic = "generic"
}
local v1 = require(GenericChallenges.Parent.enumerate)(script.Name, config)
require(GenericChallenges.Utils.addRawValueMethodToEnum)(v1, config)

return v1