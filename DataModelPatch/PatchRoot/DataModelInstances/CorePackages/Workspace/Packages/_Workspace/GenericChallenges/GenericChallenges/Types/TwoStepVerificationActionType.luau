local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local config = {
	Unknown = "Unknown",
	Login = "Login",
	RobuxSpend = "RobuxSpend",
	ItemTrade = "ItemTrade",
	PasswordReset = "PasswordReset"
}
local v1 = require(GenericChallenges.Parent.enumerate)(script.Name, config)
require(GenericChallenges.Utils.addRawValueMethodToEnum)(v1, config)

return v1