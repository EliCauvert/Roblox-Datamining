local accountUpgradeErrorModule = require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeError)
local t = {
	[accountUpgradeErrorModule.InvalidBirthday] = "Authentication.SignUp.Response.InvalidBirthday",
	[accountUpgradeErrorModule.InvalidUsername] = "Authentication.SignUp.Label.ErrorsWithUsername",
	[accountUpgradeErrorModule.InvalidPassword] = "Authentication.SignUp.Response.PasswordComplexity",
	[accountUpgradeErrorModule.InvalidEmailAddress] = "Authentication.SignUp.Response.InvalidEmail"
}

return function(p1)
	-- upvalues: t (ref)
	return if p1 == nil then "Authentication.SignUp.Response.ErrorTryAgain2" else t[p1] or "Authentication.SignUp.Response.ErrorTryAgain2"
end