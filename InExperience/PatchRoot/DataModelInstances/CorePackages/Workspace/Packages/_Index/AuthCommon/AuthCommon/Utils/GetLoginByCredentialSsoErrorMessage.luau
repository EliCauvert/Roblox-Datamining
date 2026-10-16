local AuthCommon = script:FindFirstAncestor("AuthCommon")
local GetAppFeaturePoliciesFunction = require(AuthCommon.Parent.UniversalAppPolicy).getAppFeaturePolicies
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local LoginErrorCodeSSOModule = require(AuthCommon.Enums.LoginErrorCodeSSO)
local FFlagEnableIllegalChildAccountLinkingErrorMessageOnSSOModule = require(AuthCommon.Flags.FFlagEnableIllegalChildAccountLinkingErrorMessageOnSSO)
local config = {
	[LoginErrorCodesModule.AccountLocked] = true,
	[LoginErrorCodesModule.EmptyAccountSwitchBlobRequired] = true,
	[LoginErrorCodesModule.ParentEmptyAccountSwitchBlobRequired] = true
}

local function _(p1): boolean --[[ Line: 26 | Named "isXboxPlatform" ]]
	return string.find(p1 or "", "Xbox", 1, true) ~= nil
end

local _ = function(p1, Platform) --[[ Line: 30 | Named "withPlatform" ]]
	return { p1, platform = Platform }
end

local function xboxErrorMessage(ExternalIdentityAlreadyConnected, Platform, p1, p2) --[[ Line: 34 ]]
	-- upvalues: LoginErrorCodesModule (copy), LoginErrorCodeSSOModule (copy), FFlagEnableIllegalChildAccountLinkingErrorMessageOnSSOModule (copy)
	return if ExternalIdentityAlreadyConnected == LoginErrorCodesModule.IncorrectCValueOrPassword then p1 elseif ExternalIdentityAlreadyConnected == LoginErrorCodesModule.MoreThanOneUsername or ExternalIdentityAlreadyConnected == LoginErrorCodesModule.MultipleUsersPerCredential then "Authentication.Login.Response.MoreThanOneUsername" elseif ExternalIdentityAlreadyConnected == LoginErrorCodesModule.AccountNotVerified then p2 elseif ExternalIdentityAlreadyConnected == LoginErrorCodesModule.ServiceUnavailable then "Authentication.Login.Response.ServiceUnavailable" elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.FloodedXbox then "Authentication.TwoStepVerification.Response.TooManyAttempts" elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.RobloxAccountAlreadyConnectedXbox then {
		"Authentication.Login.Response.AlreadyLinked",
		platform = Platform
	} elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.ExternalIdentityAlreadyConnectedXbox then {
		"Authentication.Login.Response.PlatformAlreadyLinked",
		platform = Platform
	} elseif FFlagEnableIllegalChildAccountLinkingErrorMessageOnSSOModule and ExternalIdentityAlreadyConnected == LoginErrorCodesModule.IllegalChildAccountLinking then "Authentication.Login.LinkIllegalChildAccountLinking" else "Authentication.Login.Response.SomethingWentWrong"
end

local _ = function(ExternalIdentityAlreadyConnected, Platform, p1) --[[ Line: 66 | Named "playstationErrorMessage" ]]
	-- upvalues: LoginErrorCodeSSOModule (copy)
	return if ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.IncorrectCValueOrPassword then p1 elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.ExternalIdentityAlreadyConnected then {
		"Authentication.Login.Response.PlatformAlreadyLinked",
		platform = Platform
	} elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.FloodedPS then "Authentication.TwoStepVerification.Response.TooManyAttempts" elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.Require2FA then "Authentication.Login.Response.Require2FAGeneric" elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.RelinkingCooldown then {
		"Authentication.Login.Response.RelinkingFreeze",
		platform = Platform
	} else "Authentication.Login.Response.SomethingWentWrong"
end

return {
	getMessage = function(ExternalIdentityAlreadyConnected, p1, p2) --[[ Line: 82 ]]
		-- upvalues: GetAppFeaturePoliciesFunction (copy), xboxErrorMessage (copy), LoginErrorCodeSSOModule (copy)
		local PlatformAccountName = GetAppFeaturePoliciesFunction().getPlatformAccountName()
		
		return if string.find(PlatformAccountName or "", "Xbox", 1, true) ~= nil then xboxErrorMessage(ExternalIdentityAlreadyConnected, PlatformAccountName, p1, p2) elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.IncorrectCValueOrPassword then p1 elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.ExternalIdentityAlreadyConnected then {
			"Authentication.Login.Response.PlatformAlreadyLinked",
			platform = PlatformAccountName
		} elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.FloodedPS then "Authentication.TwoStepVerification.Response.TooManyAttempts" elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.Require2FA then "Authentication.Login.Response.Require2FAGeneric" elseif ExternalIdentityAlreadyConnected == LoginErrorCodeSSOModule.RelinkingCooldown then {
			"Authentication.Login.Response.RelinkingFreeze",
			platform = PlatformAccountName
		} else "Authentication.Login.Response.SomethingWentWrong"
	end,
	getUiErrorCode = function(p1) --[[ Line: 95 ]]
		-- upvalues: GetAppFeaturePoliciesFunction (copy), config (copy)
		return if string.find(GetAppFeaturePoliciesFunction().getPlatformAccountName() or "", "Xbox", 1, true) ~= nil and config[p1] then p1 else nil
	end
}