local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local LoginRequestsModule = require(AuthCommon.Http.Requests.LoginRequests)
local LoginResultModule = require(AuthCommon.Models.LoginResult)
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local LoginMethodsModule = require(AuthCommon.Enums.LoginMethods)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local GetMultipleUsersPerCredentialErrorDataModule = require(AuthCommon.Utils.GetMultipleUsersPerCredentialErrorData)
local GetLoginByCredentialSsoErrorMessageModule = require(AuthCommon.Utils.GetLoginByCredentialSsoErrorMessage)
local LoginByOtpSSOErrorsTelemetryModule = require(AuthCommon.Utils.LoginByOtpSSOErrorsTelemetry)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction = require(Parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local GetFFlagEnableLoginAccountSelectorFunction = require(Parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local GetFFlagEnableGenericTwoFAMessageFunction = require(Parent.SharedFlags).GetFFlagEnableGenericTwoFAMessage
local FFlagEnableLastLoginMethodTracking = require(Parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local FFlagEnableEmailOtpSsoConnectModule = require(AuthCommon.Flags.FFlagEnableEmailOtpSsoConnect)
local EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp", false)

local function _(p1, p2, p3, p4, p5)
	-- upvalues: FFlagEnableEmailOtpSsoConnectModule (copy), GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy)
	return if FFlagEnableEmailOtpSsoConnectModule and GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCredential(p1, p2, p3, "EmailOtpSessionToken") else LoginRequestsModule.logByOtp(p1, p2, p3, p4, p5)
end

return function(p1, p2, p3, SecurityQuestionsCallback, p4, p5)
	-- upvalues: FFlagEnableEmailOtpSsoConnectModule (copy), GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy), LoginResultModule (copy), PromiseModule (copy), LoginErrorCodesModule (copy), GetFFlagEnableGenericTwoFAMessageFunction (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethodsModule (copy), HttpService (copy), GetLoginByCredentialSsoErrorMessageModule (copy), LoggingProtocolModule (copy), LoginByOtpSSOErrorsTelemetryModule (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), GetMultipleUsersPerCredentialErrorDataModule (copy), EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (copy)
	return function()
		-- upvalues: FFlagEnableEmailOtpSsoConnectModule (upval), GetAppFeaturePoliciesFunction (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), LoginRequestsModule (upval), LoginResultModule (upval), PromiseModule (upval), LoginErrorCodesModule (upval), GetFFlagEnableGenericTwoFAMessageFunction (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), HttpService (upval), GetLoginByCredentialSsoErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByOtpSSOErrorsTelemetryModule (upval), SecurityQuestionsCallback (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), GetMultipleUsersPerCredentialErrorDataModule (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (upval)
		local UseSingleSignOn = FFlagEnableEmailOtpSsoConnectModule and GetAppFeaturePoliciesFunction().getUseSingleSignOn()
		
		return (if FFlagEnableEmailOtpSsoConnectModule and GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCredential(p1, p2, p3, "EmailOtpSessionToken") else LoginRequestsModule.logByOtp(p1, p2, p3, p4, p5)):andThen(function(Entry)
			-- upvalues: LoginResultModule (upval), UseSingleSignOn (copy), GetAppFeaturePoliciesFunction (upval), PromiseModule (upval), LoginErrorCodesModule (upval), GetFFlagEnableGenericTwoFAMessageFunction (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval)
			assert(Entry, "no login attempt result")
			assert(#Entry == 1, "no result or more than one result")
			local FromJsonDataResult = LoginResultModule.fromJsonData(Entry[1])
			assert(FromJsonDataResult, "result invalid")
			
			if UseSingleSignOn then
				local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
				
				if (not AppFeaturePolicies.getLinkedAuthEndpointsEnabled() or not AppFeaturePolicies.getWebViewSupport()) and LoginResultModule.hasTwoStepData(FromJsonDataResult) then
					return PromiseModule.reject({
						errorCode = LoginErrorCodesModule.ServiceUnavailable,
						errorKey = if GetFFlagEnableGenericTwoFAMessageFunction() then "Authentication.Login.Response.Require2FAGeneric" else "Authentication.Login.Response.Require2FA"
					})
				end
			end
			if FFlagEnableLastLoginMethodTracking then
				AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(LoginMethodsModule.EmailOtp)
			end
			return FromJsonDataResult
		end, function(p6)
			-- upvalues: HttpService (upval), UseSingleSignOn (copy), GetLoginByCredentialSsoErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByOtpSSOErrorsTelemetryModule (upval), PromiseModule (upval), SecurityQuestionsCallback (upval), LoginErrorCodesModule (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), GetMultipleUsersPerCredentialErrorDataModule (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (upval)
			local Data = HttpService:JSONDecode(p6.Body)
			local Entry = nil
			local Code = Data.errors[1].code
			local SecurityQuestionsData = nil
			local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
			
			if UseSingleSignOn then
				warn("Login ErrorCode:", Code)
				Entry = GetLoginByCredentialSsoErrorMessageModule.getMessage(Code, "Authentication.Login.Response.IncorrectOtpCode", "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod")
				LoggingProtocolModule.default:logRobloxTelemetryEvent(LoginByOtpSSOErrorsTelemetryModule, nil, {
					ssoErrorCode = Code,
					msgShown = if type(Entry) == "table" then Entry[1] else Entry
				})
				
				return PromiseModule.reject({
					errorKey = Entry,
					errorCode = GetLoginByCredentialSsoErrorMessageModule.getUiErrorCode(Code),
					securityQuestionsCallback = SecurityQuestionsCallback,
					userFacingMessage = UserFacingMessage
				})
			end
			if Code == LoginErrorCodesModule.IncorrectCValueOrPassword then
				Entry = "Authentication.Login.Response.IncorrectOtpCode"
			elseif GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and Code == LoginErrorCodesModule.SecurityQuestions then
				Entry = "Authentication.Login.Response.SomethingWentWrong"
				
				if Data.errors[1].fieldData then
					local Data1 = HttpService:JSONDecode(Data.errors[1].fieldData)
					
					if Data1.sessionId and Data1.userId then
						SecurityQuestionsData = Data1
						Entry = nil
					end
				end
			else
				if GetFFlagEnableLoginAccountSelectorFunction() and Code == LoginErrorCodesModule.MultipleUsersPerCredential then
					return PromiseModule.reject({
						errorKey = Entry,
						errorCode = Code,
						usersData = GetMultipleUsersPerCredentialErrorDataModule(Data)
					})
				end
				if Code == LoginErrorCodesModule.ServiceUnavailable then
					Entry = "Authentication.Login.Response.ServiceUnavailable"
				elseif EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp and Code == LoginErrorCodesModule.IllegalChildAccountLinking then
					Entry = "Authentication.Login.LinkIllegalChildAccountLinking"
				elseif Code ~= LoginErrorCodesModule.AccountLocked then
					Entry = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
				end
			end
			return PromiseModule.reject({
				errorKey = Entry,
				errorCode = Code,
				securityQuestionsData = SecurityQuestionsData,
				securityQuestionsCallback = SecurityQuestionsCallback,
				userFacingMessage = UserFacingMessage
			})
		end)
	end
end