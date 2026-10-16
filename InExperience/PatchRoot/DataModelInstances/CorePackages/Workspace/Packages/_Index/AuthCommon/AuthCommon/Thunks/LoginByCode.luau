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
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local LoginByUsernameSSOErrorsTelemetryModule = require(AuthCommon.Utils.LoginByUsernameSSOErrorsTelemetry)
local GetLoginByUsernameErrorMessageModule = require(AuthCommon.Utils.GetLoginByUsernameErrorMessage)
local LoginMethodsModule = require(AuthCommon.Enums.LoginMethods)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local RecordLoginModule = require(AuthCommon.Utils.recordLogin)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local GetDxBlobModule = require(AuthCommon.Utils.GetDxBlob)
local GetCaptchaDataJsonModule = require(AuthCommon.Utils.GetCaptchaDataJson)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction = require(Parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local FFlagEnableLastLoginMethodTracking = require(Parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local FFlagEnableRecordLogin = require(Parent.SharedFlags).FFlagEnableRecordLogin
local EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode", false)

local function _(p1, p2, p3, p4, p5) --[[ Line: 35 | Named "loginRequest" ]]
	-- upvalues: GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy)
	return if GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCode(p1, p2, p3) else LoginRequestsModule.loginWithCode(p1, p2, p3, p4, p5)
end

return function(p1, Cvalue, p2, CaptchaCallback, p3, SecurityQuestionsCallback, p4) --[[ Line: 44 | Named "loginByCode" ]]
	-- upvalues: GetAppFeaturePoliciesFunction (copy), LoginRequestsModule (copy), LoginResultModule (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethodsModule (copy), FFlagEnableRecordLogin (copy), RecordLoginModule (copy), HttpService (copy), LoginErrorCodesModule (copy), GetDxBlobModule (copy), GetCaptchaDataJsonModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode (copy), GetLoginByUsernameErrorMessageModule (copy), LoggingProtocolModule (copy), LoginByUsernameSSOErrorsTelemetryModule (copy), PromiseModule (copy)
	return function(p5) --[[ Line: 53 ]]
		-- upvalues: GetAppFeaturePoliciesFunction (upval), p1 (copy), Cvalue (copy), p2 (copy), p3 (copy), p4 (copy), LoginRequestsModule (upval), LoginResultModule (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval), HttpService (upval), LoginErrorCodesModule (upval), GetDxBlobModule (upval), GetCaptchaDataJsonModule (upval), AppPage (upval), CaptchaCallback (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode (upval), GetLoginByUsernameErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByUsernameSSOErrorsTelemetryModule (upval), PromiseModule (upval), SecurityQuestionsCallback (copy)
		local UseSingleSignOn = GetAppFeaturePoliciesFunction().getUseSingleSignOn()
		
		return (if GetAppFeaturePoliciesFunction().getUseSingleSignOn() then LoginRequestsModule.singleSignOnConnectWithCode(p1, Cvalue, p2) else LoginRequestsModule.loginWithCode(p1, Cvalue, p2, p3, p4)):andThen(function(Entry) --[[ Line: 56 ]]
			-- upvalues: LoginResultModule (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval)
			assert(Entry, "no login attempt result")
			assert(#Entry == 1, "no result or more than one result")
			assert(LoginResultModule.fromJsonData(Entry[1]), "result invalid")
			
			if FFlagEnableLastLoginMethodTracking then
				AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(LoginMethodsModule.QuickLogin)
			end
			local FromJsonDataResult = LoginResultModule.fromJsonData(Entry[1])
			
			if FFlagEnableRecordLogin then
				pcall(function() --[[ Line: 65 ]]
					-- upvalues: RecordLoginModule (upval), FromJsonDataResult (copy), LoginMethodsModule (upval)
					RecordLoginModule(FromJsonDataResult, LoginMethodsModule.QuickLogin, FromJsonDataResult.user.name)
				end)
			end
			return FromJsonDataResult
		end, function(p6) --[[ Line: 71 ]]
			-- upvalues: HttpService (upval), LoginErrorCodesModule (upval), GetDxBlobModule (upval), GetCaptchaDataJsonModule (upval), AppPage (upval), CaptchaCallback (upval), Cvalue (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p5 (copy), NavigateDownFunction (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode (upval), UseSingleSignOn (copy), GetLoginByUsernameErrorMessageModule (upval), LoggingProtocolModule (upval), LoginByUsernameSSOErrorsTelemetryModule (upval), PromiseModule (upval), SecurityQuestionsCallback (upval)
			local Data = HttpService:JSONDecode(p6.Body)
			local Code = Data and (Data.errors and (Data.errors[1] and Data.errors[1].code))
			local SecurityQuestionsData = nil
			local Entry = nil
			local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
			
			if Code == LoginErrorCodesModule.Captcha then
				local _ = GetDxBlobModule(Data)
				local CaptchaDataJsonModule, CaptchaDataJsonModule2 = GetCaptchaDataJsonModule(Data)
				local config = {
					detail = "",
					name = AppPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "authToken",
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
			elseif EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode and Code == LoginErrorCodesModule.IllegalChildAccountLinking then
				Entry = "Authentication.Login.LinkIllegalChildAccountLinking"
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