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
local LoginByUsernameSSOErrorsTelemetryModule = require(AuthCommon.Utils.LoginByUsernameSSOErrorsTelemetry)
local GetLoginByUsernameErrorMessageModule = require(AuthCommon.Utils.GetLoginByUsernameErrorMessage)
local LoginMethodsModule = require(AuthCommon.Enums.LoginMethods)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local RecordLoginModule = require(AuthCommon.Utils.recordLogin)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local GetDxBlobModule = require(AuthCommon.Utils.GetDxBlob)
local GetCaptchaDataJsonModule = require(AuthCommon.Utils.GetCaptchaDataJson)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction = require(Parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local GetFFlagEnableGenericTwoFAMessageFunction = require(Parent.SharedFlags).GetFFlagEnableGenericTwoFAMessage
local FFlagEnableLastLoginMethodTracking = require(Parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local EnablePasskeyOnlyUserErrorMessage = game:DefineFastFlag("EnablePasskeyOnlyUserErrorMessage", false)
local FFlagEnableRecordLogin = require(Parent.SharedFlags).FFlagEnableRecordLogin
local EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername", false)
local EnableLoginNetworkingErrorToast = game:DefineFastFlag("EnableLoginNetworkingErrorToast", false)
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

local function _(p1, p2, p3, p4, p5)
	-- upvalues: GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy)
	return if GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCredential(p1, p2, p3, "Username") else LoginRequestsModule.logByUsername(p1, p2, p3, p4, p5)
end

return function(p1, Cvalue, p2, CaptchaCallback, p3, SecurityQuestionsCallback, p4)
	-- upvalues: GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy), LoginResultModule (copy), PromiseModule (copy), LoginErrorCodesModule (copy), GetFFlagEnableGenericTwoFAMessageFunction (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethodsModule (copy), FFlagEnableRecordLogin (copy), RecordLoginModule (copy), EnableLoginNetworkingErrorToast (copy), SetNetworkingErrorToastFunction (copy), HttpService (copy), GetDxBlobModule (copy), GetCaptchaDataJsonModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (copy), EnablePasskeyOnlyUserErrorMessage (copy), GetLoginByUsernameErrorMessageModule (copy), LoggingProtocolModule (copy), LoginByUsernameSSOErrorsTelemetryModule (copy)
	return function(p5)
		-- upvalues: GetAppFeaturePoliciesFunction (upval), p1 (copy), Cvalue (copy), p2 (copy), p3 (copy), p4 (copy), LoginRequestsModule (upval), LoginResultModule (upval), PromiseModule (upval), LoginErrorCodesModule (upval), GetFFlagEnableGenericTwoFAMessageFunction (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval), EnableLoginNetworkingErrorToast (upval), SetNetworkingErrorToastFunction (upval), HttpService (upval), GetDxBlobModule (upval), GetCaptchaDataJsonModule (upval), AppPage (upval), CaptchaCallback (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (upval), EnablePasskeyOnlyUserErrorMessage (upval), GetLoginByUsernameErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByUsernameSSOErrorsTelemetryModule (upval), SecurityQuestionsCallback (copy)
		local UseSingleSignOn = GetAppFeaturePoliciesFunction().getUseSingleSignOn()
		
		return (if GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCredential(p1, Cvalue, p2, "Username") else LoginRequestsModule.logByUsername(p1, Cvalue, p2, p3, p4)):andThen(function(Entry)
			-- upvalues: LoginResultModule (upval), GetAppFeaturePoliciesFunction (upval), UseSingleSignOn (copy), PromiseModule (upval), LoginErrorCodesModule (upval), GetFFlagEnableGenericTwoFAMessageFunction (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval), Cvalue (upval)
			assert(Entry, "no login attempt result")
			assert(#Entry == 1, "no result or more than one result")
			local FromJsonDataResult = LoginResultModule.fromJsonData(Entry[1])
			assert(FromJsonDataResult, "result invalid")
			local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
			
			if (UseSingleSignOn and not AppFeaturePolicies.getLinkedAuthEndpointsEnabled() or not AppFeaturePolicies.getWebViewSupport()) and FromJsonDataResult and LoginResultModule.hasTwoStepData(FromJsonDataResult) then
				return PromiseModule.reject({
					errorCode = LoginErrorCodesModule.ServiceUnavailable,
					errorKey = if GetFFlagEnableGenericTwoFAMessageFunction() then "Authentication.Login.Response.Require2FAGeneric" else "Authentication.Login.Response.Require2FA"
				})
			end
			if FFlagEnableLastLoginMethodTracking then
				AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(LoginMethodsModule.Username)
			end
			if FFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: RecordLoginModule (upval), FromJsonDataResult (copy), LoginMethodsModule (upval), Cvalue (upval)
					RecordLoginModule(FromJsonDataResult, LoginMethodsModule.Username, Cvalue)
				end)
			end
			return FromJsonDataResult
		end, function(p6)
			-- upvalues: EnableLoginNetworkingErrorToast (upval), p5 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval), HttpService (upval), LoginErrorCodesModule (upval), GetDxBlobModule (upval), GetCaptchaDataJsonModule (upval), AppPage (upval), CaptchaCallback (upval), Cvalue (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (upval), EnablePasskeyOnlyUserErrorMessage (upval), UseSingleSignOn (copy), GetLoginByUsernameErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByUsernameSSOErrorsTelemetryModule (upval), SecurityQuestionsCallback (upval)
			if EnableLoginNetworkingErrorToast and p6.Body == nil and p6.HttpError ~= nil and p6.HttpError ~= Enum.HttpError.OK then
				p5:dispatch(SetNetworkingErrorToastFunction(p6))
				
				return PromiseModule.reject({ errorKey = nil, errorCode = nil })
			end
			local Data = HttpService:JSONDecode(p6.Body)
			local Entry = nil
			local Code = Data.errors[1].code
			local SecurityQuestionsData = nil
			local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
			
			if Code == LoginErrorCodesModule.IncorrectCValueOrPassword then
				Entry = "Authentication.Login.Response.IncorrectUsernamePassword"
			elseif Code == LoginErrorCodesModule.Captcha then
				local _ = GetDxBlobModule(Data)
				local CaptchaDataJsonModule, CaptchaDataJsonModule2 = GetCaptchaDataJsonModule(Data)
				local config = {
					detail = "",
					name = AppPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "username",
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
					p5:dispatch(NavigateDownFunction(config))
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
			elseif Code == LoginErrorCodesModule.ServiceUnavailable then
				Entry = "Authentication.Login.Response.ServiceUnavailable"
			elseif EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername and Code == LoginErrorCodesModule.IllegalChildAccountLinking then
				Entry = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif EnablePasskeyOnlyUserErrorMessage and Code == LoginErrorCodesModule.PasskeyOnlyUser then
				Entry = "Authentication.Login.Error.PasskeyOnlyAccount"
			elseif Code ~= LoginErrorCodesModule.AccountLocked then
				Entry = "Authentication.Login.Response.SomethingWentWrong"
			end
			if UseSingleSignOn then
				warn("Login ErrorCode:", Code)
				Entry = GetLoginByUsernameErrorMessageModule(Code)
				LoggingProtocolModule.default:logRobloxTelemetryEvent(LoginByUsernameSSOErrorsTelemetryModule, nil, {
					ssoErrorCode = Code,
					msgShown = if Entry[1] then Entry[1] else Entry
				})
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