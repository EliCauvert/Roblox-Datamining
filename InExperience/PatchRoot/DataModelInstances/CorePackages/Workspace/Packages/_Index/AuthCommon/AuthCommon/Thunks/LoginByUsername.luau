local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local loginRequestsModule = require(authCommon.Http.Requests.LoginRequests)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local loginResultModule = require(authCommon.Models.LoginResult)
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local loginByUsernameSSOErrorsTelemetryModule = require(authCommon.Utils.LoginByUsernameSSOErrorsTelemetry)
local getLoginByUsernameErrorMessageModule = require(authCommon.Utils.GetLoginByUsernameErrorMessage)
local loginMethodsModule = require(authCommon.Enums.LoginMethods)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local recordLoginModule = require(authCommon.Utils.recordLogin)
local loggingProtocolModule = require(parent.LoggingProtocol)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local getDxBlobModule = require(authCommon.Utils.GetDxBlob)
local getCaptchaDataJsonModule = require(authCommon.Utils.GetCaptchaDataJson)
local getFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local getFFlagEnableGenericTwoFAMessage = require(parent.SharedFlags).GetFFlagEnableGenericTwoFAMessage
local fFlagEnableLastLoginMethodTracking = require(parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local enablePasskeyOnlyUserErrorMessage = game:DefineFastFlag("EnablePasskeyOnlyUserErrorMessage", false)
local fFlagEnableRecordLogin = require(parent.SharedFlags).FFlagEnableRecordLogin
local enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername", false)
local enableLoginNetworkingErrorToast = game:DefineFastFlag("EnableLoginNetworkingErrorToast", false)
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

local function _(p1, p2, p3, p4, p5)
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref)
	return if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCredential(p1, p2, p3, "Username") else loginRequestsModule.logByUsername(p1, p2, p3, p4, p5)
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref), loginResultModule (ref), promiseModule (ref), loginErrorCodesModule (ref), getFFlagEnableGenericTwoFAMessage (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), enableLoginNetworkingErrorToast (ref), setNetworkingErrorToast (ref), httpService (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (ref), enablePasskeyOnlyUserErrorMessage (ref), getLoginByUsernameErrorMessageModule (ref), loggingProtocolModule (ref), loginByUsernameSSOErrorsTelemetryModule (ref)
	return function(p8)
		-- upvalues: getAppFeaturePolicies (copy), p1 (ref), p2 (ref), p3 (ref), p5 (ref), p7 (ref), loginRequestsModule (copy), loginResultModule (copy), promiseModule (copy), loginErrorCodesModule (copy), getFFlagEnableGenericTwoFAMessage (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), enableLoginNetworkingErrorToast (copy), setNetworkingErrorToast (copy), httpService (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (copy), enablePasskeyOnlyUserErrorMessage (copy), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), p6 (ref)
		local useSingleSignOn = getAppFeaturePolicies().getUseSingleSignOn()
		
		return (if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCredential(p1, p2, p3, "Username") else loginRequestsModule.logByUsername(p1, p2, p3, p5, p7)):andThen(function(p9)
			-- upvalues: loginResultModule (copy), getAppFeaturePolicies (copy), useSingleSignOn (ref), promiseModule (copy), loginErrorCodesModule (copy), getFFlagEnableGenericTwoFAMessage (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), p2 (copy)
			assert(p9, "no login attempt result")
			assert(#p9 == 1, "no result or more than one result")
			local var2 = loginResultModule.fromJsonData(p9[1])
			assert(var2, "result invalid")
			local var3 = getAppFeaturePolicies()
			
			if (useSingleSignOn and not var3.getLinkedAuthEndpointsEnabled() or not var3.getWebViewSupport()) and var2 and loginResultModule.hasTwoStepData(var2) then
				return promiseModule.reject({
					errorCode = loginErrorCodesModule.ServiceUnavailable,
					errorKey = if getFFlagEnableGenericTwoFAMessage() then "Authentication.Login.Response.Require2FAGeneric" else "Authentication.Login.Response.Require2FA"
				})
			elseif fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Username)
			end
			if fFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: recordLoginModule (copy), var2 (ref), loginMethodsModule (copy), p2 (copy)
					recordLoginModule(var2, loginMethodsModule.Username, p2)
				end)
			end
			return var2
		end, function(p9)
			-- upvalues: enableLoginNetworkingErrorToast (copy), p8 (ref), setNetworkingErrorToast (copy), promiseModule (copy), httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (copy), p2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (copy), enablePasskeyOnlyUserErrorMessage (copy), useSingleSignOn (ref), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), p6 (copy)
			if enableLoginNetworkingErrorToast and p9.Body == nil and (p9.HttpError ~= nil and p9.HttpError ~= Enum.HttpError.OK) then
				p8:dispatch(setNetworkingErrorToast(p9))
				
				return promiseModule.reject({ errorKey = nil, errorCode = nil })
			end
			local body = httpService:JSONDecode(p9.Body)
			local var2 = nil
			local code = body.errors[1].code
			local var3 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var2 = "Authentication.Login.Response.IncorrectUsernamePassword"
			elseif code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var4, var5 = getCaptchaDataJsonModule(body)
				var4 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "username",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = p4,
						captchaId = var4,
						cvalue = p2,
						dxBlob = var5
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(var4))
				else
					p8:dispatch(navigateDown(var4))
				end
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var2 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var3 = fieldData
						var2 = nil
					end
				end
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var2 = "Authentication.Login.Response.ServiceUnavailable"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var2 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif enablePasskeyOnlyUserErrorMessage and code == loginErrorCodesModule.PasskeyOnlyUser then
				var2 = "Authentication.Login.Error.PasskeyOnlyAccount"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var2 = "Authentication.Login.Response.SomethingWentWrong"
			end
			if useSingleSignOn then
				warn("Login ErrorCode:", code)
				var2 = getLoginByUsernameErrorMessageModule(code)
				loggingProtocolModule.default:logRobloxTelemetryEvent(loginByUsernameSSOErrorsTelemetryModule, nil, {
					ssoErrorCode = code,
					msgShown = if var2[1] then var2[1] else var2
				})
			end
			return promiseModule.reject({
				errorKey = var2,
				errorCode = code,
				securityQuestionsData = var3,
				securityQuestionsCallback = p6,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end