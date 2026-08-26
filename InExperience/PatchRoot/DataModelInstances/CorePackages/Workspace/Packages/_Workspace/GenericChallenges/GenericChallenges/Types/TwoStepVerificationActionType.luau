local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local addRawValueMethodToEnumModule = require(genericChallenges.Utils.addRawValueMethodToEnum)
local t = {
	Unknown = "Unknown",
	Login = "Login",
	RobuxSpend = "RobuxSpend",
	ItemTrade = "ItemTrade",
	PasswordReset = "PasswordReset"
}
local var1 = require(genericChallenges.Parent.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var1, t)

return var1