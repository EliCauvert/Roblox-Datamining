local authCommon = script:FindFirstAncestor("AuthCommon")
local getAppFeaturePolicies = require(authCommon.Parent.UniversalAppPolicy).getAppFeaturePolicies
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local loginErrorCodeSSOModule = require(authCommon.Enums.LoginErrorCodeSSO)
local fFlagEnableIllegalChildAccountLinkingErrorMessageOnSSOModule = require(authCommon.Flags.FFlagEnableIllegalChildAccountLinkingErrorMessageOnSSO)
local t = {
	[loginErrorCodesModule.AccountLocked] = true,
	[loginErrorCodesModule.EmptyAccountSwitchBlobRequired] = true,
	[loginErrorCodesModule.ParentEmptyAccountSwitchBlobRequired] = true
}

local function _(p1)
	return string.find(p1 or "", "Xbox", 1, true) ~= nil
end

local _ = function(p1, p2)
	return { p1, platform = p2 }
end

local function xboxErrorMessage(p1, p2, p3, p4)
	-- upvalues: loginErrorCodesModule (ref), loginErrorCodeSSOModule (ref), fFlagEnableIllegalChildAccountLinkingErrorMessageOnSSOModule (ref)
	return if p1 == loginErrorCodesModule.IncorrectCValueOrPassword then p3 elseif p1 == loginErrorCodesModule.MoreThanOneUsername or p1 == loginErrorCodesModule.MultipleUsersPerCredential then "Authentication.Login.Response.MoreThanOneUsername" elseif p1 == loginErrorCodesModule.AccountNotVerified then p4 elseif p1 == loginErrorCodesModule.ServiceUnavailable then "Authentication.Login.Response.ServiceUnavailable" elseif p1 == loginErrorCodeSSOModule.FloodedXbox then "Authentication.TwoStepVerification.Response.TooManyAttempts" elseif p1 == loginErrorCodeSSOModule.RobloxAccountAlreadyConnectedXbox then {
		"Authentication.Login.Response.AlreadyLinked",
		platform = p2
	} elseif p1 == loginErrorCodeSSOModule.ExternalIdentityAlreadyConnectedXbox then {
		"Authentication.Login.Response.PlatformAlreadyLinked",
		platform = p2
	} elseif fFlagEnableIllegalChildAccountLinkingErrorMessageOnSSOModule and p1 == loginErrorCodesModule.IllegalChildAccountLinking then "Authentication.Login.LinkIllegalChildAccountLinking" else "Authentication.Login.Response.SomethingWentWrong"
end

local _ = function(p1, p2, p3)
	-- upvalues: loginErrorCodeSSOModule (ref)
	return if p1 == loginErrorCodeSSOModule.IncorrectCValueOrPassword then p3 elseif p1 == loginErrorCodeSSOModule.ExternalIdentityAlreadyConnected then {
		"Authentication.Login.Response.PlatformAlreadyLinked",
		platform = p2
	} elseif p1 == loginErrorCodeSSOModule.FloodedPS then "Authentication.TwoStepVerification.Response.TooManyAttempts" elseif p1 == loginErrorCodeSSOModule.Require2FA then "Authentication.Login.Response.Require2FAGeneric" elseif p1 == loginErrorCodeSSOModule.RelinkingCooldown then {
		"Authentication.Login.Response.RelinkingFreeze",
		platform = p2
	} else "Authentication.Login.Response.SomethingWentWrong"
end

return {
	getMessage = function(p1, p2, p3)
		-- upvalues: getAppFeaturePolicies (ref), xboxErrorMessage (ref), loginErrorCodeSSOModule (ref)
		local platformAccountName = getAppFeaturePolicies().getPlatformAccountName()
		
		return if string.find(platformAccountName or "", "Xbox", 1, true) ~= nil then xboxErrorMessage(p1, platformAccountName, p2, p3) elseif p1 == loginErrorCodeSSOModule.IncorrectCValueOrPassword then p2 elseif p1 == loginErrorCodeSSOModule.ExternalIdentityAlreadyConnected then {
			"Authentication.Login.Response.PlatformAlreadyLinked",
			platform = platformAccountName
		} elseif p1 == loginErrorCodeSSOModule.FloodedPS then "Authentication.TwoStepVerification.Response.TooManyAttempts" elseif p1 == loginErrorCodeSSOModule.Require2FA then "Authentication.Login.Response.Require2FAGeneric" elseif p1 == loginErrorCodeSSOModule.RelinkingCooldown then {
			"Authentication.Login.Response.RelinkingFreeze",
			platform = platformAccountName
		} else "Authentication.Login.Response.SomethingWentWrong"
	end,
	getUiErrorCode = function(p1)
		-- upvalues: getAppFeaturePolicies (ref), t (ref)
		return if string.find(getAppFeaturePolicies().getPlatformAccountName() or "", "Xbox", 1, true) ~= nil and t[p1] then p1 else nil
	end
}