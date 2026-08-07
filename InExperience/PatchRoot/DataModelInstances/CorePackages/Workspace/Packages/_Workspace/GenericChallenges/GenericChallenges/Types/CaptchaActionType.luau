local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local addRawValueMethodToEnumModule = require(genericChallenges.Utils.addRawValueMethodToEnum)
local t = {
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
local var3 = require(genericChallenges.Parent.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var3, t)

return var3