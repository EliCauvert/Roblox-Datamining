local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local AddRawValueMethodToEnumModule: (any, any) -> () = require(GenericChallenges.Utils.addRawValueMethodToEnum)
local EnumerateModule = require(Parent.enumerate)
local config = {
	Unknown = "Unknown",
	Login = "Login",
	RobuxSpend = "RobuxSpend",
	ItemTrade = "ItemTrade",
	PasswordReset = "PasswordReset"
}
local EnumerateModuleResult = EnumerateModule(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateModuleResult, config)

return EnumerateModuleResult