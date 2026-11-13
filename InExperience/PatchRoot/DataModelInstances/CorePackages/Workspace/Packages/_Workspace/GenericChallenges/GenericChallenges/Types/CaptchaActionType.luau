local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local AddRawValueMethodToEnumModule: (any, any) -> () = require(GenericChallenges.Utils.addRawValueMethodToEnum)
local EnumerateModule = require(Parent.enumerate)
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
local EnumerateModuleResult = EnumerateModule(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateModuleResult, config)

return EnumerateModuleResult