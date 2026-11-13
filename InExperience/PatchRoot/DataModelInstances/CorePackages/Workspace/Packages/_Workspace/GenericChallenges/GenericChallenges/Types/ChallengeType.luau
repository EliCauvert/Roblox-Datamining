local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local AddRawValueMethodToEnumModule: (any, any) -> () = require(GenericChallenges.Utils.addRawValueMethodToEnum)
local EnumerateModule = require(Parent.enumerate)
local config = {
	Captcha = "captcha",
	TwoStepVerification = "two-step-verification",
	SecurityQuestions = "security-questions",
	Reauthentication = "reauthentication",
	Generic = "generic"
}
local EnumerateModuleResult = EnumerateModule(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateModuleResult, config)

return EnumerateModuleResult