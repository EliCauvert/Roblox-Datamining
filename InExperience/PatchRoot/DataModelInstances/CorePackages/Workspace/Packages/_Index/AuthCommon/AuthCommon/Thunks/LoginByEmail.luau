local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local LoginRequestsModule = require(AuthCommon.Http.Requests.LoginRequests)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local LoginResultModule = require(AuthCommon.Models.LoginResult)
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local LoginMethodsModule = require(AuthCommon.Enums.LoginMethods)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local GetMultipleUsersPerCredentialErrorDataModule = require(AuthCommon.Utils.GetMultipleUsersPerCredentialErrorData)
local GetDxBlobModule = require(AuthCommon.Utils.GetDxBlob)
local GetCaptchaDataJsonModule = require(AuthCommon.Utils.GetCaptchaDataJson)
local GetLoginByCredentialSsoErrorMessageModule = require(AuthCommon.Utils.GetLoginByCredentialSsoErrorMessage)
local LoginByEmailSSOErrorsTelemetryModule = require(AuthCommon.Utils.LoginByEmailSSOErrorsTelemetry)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction = require(Parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local GetFFlagEnableLoginAccountSelectorFunction = require(Parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local GetFFlagEnableGenericTwoFAMessageFunction = require(Parent.SharedFlags).GetFFlagEnableGenericTwoFAMessage
local FFlagEnableLastLoginMethodTracking = require(Parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local RecordLoginModule = require(AuthCommon.Utils.recordLogin)
local FFlagEnableRecordLogin = require(Parent.SharedFlags).FFlagEnableRecordLogin
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail", false)
local FFlagEnableEmailSsoConnectModule = require(AuthCommon.Flags.FFlagEnableEmailSsoConnect)

local function loginRequest(p1, Cvalue, p2, p3, p4, p5)
	-- upvalues: FFlagEnableEmailSsoConnectModule (copy), GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy)
	return if FFlagEnableEmailSsoConnectModule and GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCredential(p1, Cvalue, p2, "Email") else LoginRequestsModule.logByEmail(p1, Cvalue, p2, p3, p4, p5)
end

return function(p1, Cvalue, p2, CaptchaCallback, p3, SecurityQuestionsCallback, p4, p5)
	-- upvalues: FFlagEnableEmailSsoConnectModule (copy), GetAppFeaturePoliciesFunction (copy), loginRequest (copy), LoginResultModule (copy), PromiseModule (copy), LoginErrorCodesModule (copy), GetFFlagEnableGenericTwoFAMessageFunction (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethodsModule (copy), FFlagEnableRecordLogin (copy), RecordLoginModule (copy), HttpService (copy), GetLoginByCredentialSsoErrorMessageModule (copy), LoggingProtocolModule (copy), LoginByEmailSSOErrorsTelemetryModule (copy), GetDxBlobModule (copy), GetCaptchaDataJsonModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), GetMultipleUsersPerCredentialErrorDataModule (copy), EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail (copy)
	return function(p6)
		-- upvalues: FFlagEnableEmailSsoConnectModule (upval), GetAppFeaturePoliciesFunction (upval), loginRequest (upval), p1 (copy), Cvalue (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), LoginResultModule (upval), PromiseModule (upval), LoginErrorCodesModule (upval), GetFFlagEnableGenericTwoFAMessageFunction (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval), HttpService (upval), GetLoginByCredentialSsoErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByEmailSSOErrorsTelemetryModule (upval), SecurityQuestionsCallback (copy), GetDxBlobModule (upval), GetCaptchaDataJsonModule (upval), AppPage (upval), CaptchaCallback (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), GetMultipleUsersPerCredentialErrorDataModule (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail (upval)
		local UseSingleSignOn = FFlagEnableEmailSsoConnectModule and GetAppFeaturePoliciesFunction().getUseSingleSignOn()
		
		return loginRequest(p1, Cvalue, p2, p3, p4, p5):andThen(function(Entry)
			-- upvalues: LoginResultModule (upval), UseSingleSignOn (copy), GetAppFeaturePoliciesFunction (upval), PromiseModule (upval), LoginErrorCodesModule (upval), GetFFlagEnableGenericTwoFAMessageFunction (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval), Cvalue (upval)
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
				AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(LoginMethodsModule.Email)
			end
			if FFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: RecordLoginModule (upval), FromJsonDataResult (copy), LoginMethodsModule (upval), Cvalue (upval)
					RecordLoginModule(FromJsonDataResult, LoginMethodsModule.Email, Cvalue)
				end)
			end
			return FromJsonDataResult
		end, function(p7)
			-- upvalues: HttpService (upval), UseSingleSignOn (copy), GetLoginByCredentialSsoErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByEmailSSOErrorsTelemetryModule (upval), PromiseModule (upval), SecurityQuestionsCallback (upval), LoginErrorCodesModule (upval), GetDxBlobModule (upval), GetCaptchaDataJsonModule (upval), AppPage (upval), CaptchaCallback (upval), Cvalue (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p6 (copy), NavigateDownFunction (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), GetMultipleUsersPerCredentialErrorDataModule (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail (upval)
			local Data = HttpService:JSONDecode(p7.Body)
			local Entry = nil
			local Code = Data.errors[1].code
			local SecurityQuestionsData = nil
			local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
			
			if UseSingleSignOn then
				warn("Login ErrorCode:", Code)
				Entry = GetLoginByCredentialSsoErrorMessageModule.getMessage(Code, "Authentication.Login.Response.IncorrectEmailOrPassword", "Authentication.Login.Response.UnverifiedEmailLoginWithUsername")
				LoggingProtocolModule.default:logRobloxTelemetryEvent(LoginByEmailSSOErrorsTelemetryModule, nil, {
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
				Entry = "Authentication.Login.Response.IncorrectEmailOrPassword"
			elseif Code == LoginErrorCodesModule.Captcha then
				local _ = GetDxBlobModule(Data)
				local CaptchaDataJsonModule, CaptchaDataJsonModule2 = GetCaptchaDataJsonModule(Data)
				local config = {
					detail = "",
					name = AppPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "email",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = CaptchaCallback,
						captchaId = CaptchaDataJsonModule,
						cvalue = Cvalue,
						dxBlob = CaptchaDataJsonModule2
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				else
					p6:dispatch(NavigateDownFunction(config))
				end
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
				if Code == LoginErrorCodesModule.MoreThanOneUsername then
					Entry = "Authentication.Login.Response.MoreThanOneUsername"
				elseif Code == LoginErrorCodesModule.ServiceUnavailable then
					Entry = "Authentication.Login.Response.ServiceUnavailable"
				elseif Code == LoginErrorCodesModule.AccountNotVerified then
					Entry = "Authentication.Login.Response.UnverifiedEmailLoginWithUsername"
				elseif EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail and Code == LoginErrorCodesModule.IllegalChildAccountLinking then
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