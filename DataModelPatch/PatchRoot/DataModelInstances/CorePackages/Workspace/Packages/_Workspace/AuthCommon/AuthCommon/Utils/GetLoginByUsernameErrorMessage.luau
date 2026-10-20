local AuthCommon = script:FindFirstAncestor("AuthCommon")
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local LoginErrorCodeSSOModule = require(AuthCommon.Enums.LoginErrorCodeSSO)
local PlatformAccountName = require(AuthCommon.Parent.UniversalAppPolicy).getAppFeaturePolicies().getPlatformAccountName()
local config = {
	[LoginErrorCodeSSOModule.AuthError] = "Authentication.Login.Response.SomethingWentWrong",
	[LoginErrorCodeSSOModule.ExternalIdentityAlreadyConnected] = {
		"Authentication.Login.Response.AlreadyLinked",
		platform = PlatformAccountName
	},
	[LoginErrorCodeSSOModule.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword",
	[LoginErrorCodeSSOModule.FloodedPS] = "Authentication.TwoStepVerification.Response.TooManyAttempts",
	[LoginErrorCodeSSOModule.Require2FA] = "Authentication.Login.Response.Require2FAGeneric",
	[LoginErrorCodeSSOModule.RelinkingCooldown] = {
		"Authentication.Login.Response.RelinkingFreeze",
		platform = PlatformAccountName
	},
	[LoginErrorCodesModule.IncorrectCValueOrPassword] = "Authentication.Login.Response.IncorrectUsernamePassword",
	[LoginErrorCodeSSOModule.FloodedXbox] = "Authentication.TwoStepVerification.Response.TooManyAttempts",
	[LoginErrorCodeSSOModule.RobloxAccountAlreadyConnectedXbox] = {
		"Authentication.Login.Response.AlreadyLinked",
		platform = PlatformAccountName
	},
	[LoginErrorCodeSSOModule.ExternalIdentityAlreadyConnectedXbox] = {
		"Authentication.Login.Response.AlreadyLinked",
		platform = PlatformAccountName
	}
}

if game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnSSO", false) then
	config[LoginErrorCodesModule.IllegalChildAccountLinking] = "Authentication.Login.LinkIllegalChildAccountLinking"
end
return function(p1)
	-- upvalues: config (copy)
	return if config[p1] then config[p1] else "Authentication.Login.Response.SomethingWentWrong"
end