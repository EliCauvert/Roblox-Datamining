local authCommon = script:FindFirstAncestor("AuthCommon")
local getAppFeaturePolicies = require(authCommon.Parent.UniversalAppPolicy).getAppFeaturePolicies
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local loginErrorCodeSSOModule = require(authCommon.Enums.LoginErrorCodeSSO)
local enableIllegalChildAccountLinkingErrorMessageOnSSO = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnSSO", false)
local platformAccountName = getAppFeaturePolicies().getPlatformAccountName()
local t = {
	[loginErrorCodeSSOModule.AuthError] = "Authentication.Login.Response.SomethingWentWrong",
	[loginErrorCodeSSOModule.ExternalIdentityAlreadyConnected] = {
		"Authentication.Login.Response.AlreadyLinked",
		platform = platformAccountName
	},
	[loginErrorCodeSSOModule.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword",
	[loginErrorCodeSSOModule.FloodedPS] = "Authentication.TwoStepVerification.Response.TooManyAttempts",
	[loginErrorCodeSSOModule.Require2FA] = "Authentication.Login.Response.Require2FAGeneric",
	[loginErrorCodeSSOModule.RelinkingCooldown] = {
		"Authentication.Login.Response.RelinkingFreeze",
		platform = platformAccountName
	},
	[loginErrorCodesModule.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword",
	[loginErrorCodeSSOModule.FloodedXbox] = "Authentication.TwoStepVerification.Response.TooManyAttempts",
	[loginErrorCodeSSOModule.RobloxAccountAlreadyConnectedXbox] = {
		"Authentication.Login.Response.AlreadyLinked",
		platform = platformAccountName
	},
	[loginErrorCodeSSOModule.ExternalIdentityAlreadyConnectedXbox] = {
		"Authentication.Login.Response.AlreadyLinked",
		platform = platformAccountName
	}
}

if enableIllegalChildAccountLinkingErrorMessageOnSSO then
	t[loginErrorCodesModule.IllegalChildAccountLinking] = "Authentication.Login.LinkIllegalChildAccountLinking"
end
return function(p0) --[[ line: 44 | named "GetLoginByUsernameErrorMessage" ]]
	-- upvalues: t (ref)
	return if t[p0] then t[p0] else "Authentication.Login.Response.SomethingWentWrong"
end