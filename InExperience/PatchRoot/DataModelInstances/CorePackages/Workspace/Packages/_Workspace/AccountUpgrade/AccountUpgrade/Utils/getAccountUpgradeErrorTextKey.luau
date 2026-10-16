local AccountUpgradeErrorModule = require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeError)
local config = {
	[AccountUpgradeErrorModule.InvalidBirthday] = "Authentication.SignUp.Response.InvalidBirthday",
	[AccountUpgradeErrorModule.InvalidUsername] = "Authentication.SignUp.Label.ErrorsWithUsername",
	[AccountUpgradeErrorModule.InvalidPassword] = "Authentication.SignUp.Response.PasswordComplexity",
	[AccountUpgradeErrorModule.InvalidEmailAddress] = "Authentication.SignUp.Response.InvalidEmail"
}

return function(p1) --[[ Line: 16 | Named "getAccountUpgradeErrorTextKey" ]]
	-- upvalues: config (copy)
	return if p1 == nil then "Authentication.SignUp.Response.ErrorTryAgain2" else config[p1] or "Authentication.SignUp.Response.ErrorTryAgain2"
end