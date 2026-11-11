local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local config = {
	Login = "Login",
	AppLogin = "AppLogin",
	Signup = "Signup",
	AppSignup = "AppSignup",
	GroupJoin = "GroupJoin",
	GroupWallPost = "GroupWallPost",
	ResetPassword = "ResetPassword",
	ToyCodeRedeem = "ToyCodeRedeem",
	GameCardRedeem = "GameCardRedeem",
	FollowUser = "FollowUser"
}
local v1 = require(GenericChallenges.Parent.enumerate)(script.Name, config)
require(GenericChallenges.Utils.addRawValueMethodToEnum)(v1, config)

return v1