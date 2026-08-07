local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local loginRequestsModule = require(authCommon.Http.Requests.LoginRequests)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

local function _(p0, p1, p2, p3, p4) --[[ line: 38 | named "loginRequest" ]]
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref)
	return if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCredential(p0, p1, p2, "Username") else loginRequestsModule.logByUsername(p0, p1, p2, p3, p4)
end

return function(p5, p6, p7, p8, p9, p10, p11) --[[ line: 48 | named "loginByUsername" ]]
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref), loginResultModule (ref), promiseModule (ref), loginErrorCodesModule (ref), getFFlagEnableGenericTwoFAMessage (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), httpService (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (ref), enablePasskeyOnlyUserErrorMessage (ref), getLoginByUsernameErrorMessageModule (ref), loggingProtocolModule (ref), loginByUsernameSSOErrorsTelemetryModule (ref)
	return function(p12) --[[ line: 57 ]]
		-- upvalues: getAppFeaturePolicies (copy), p5 (ref), p6 (ref), p7 (ref), p9 (ref), p11 (ref), loginRequestsModule (copy), loginResultModule (copy), promiseModule (copy), loginErrorCodesModule (copy), getFFlagEnableGenericTwoFAMessage (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), httpService (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p8 (ref), fFlagSignalsNavP3Dispatch (copy), var4 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (copy), enablePasskeyOnlyUserErrorMessage (copy), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), p10 (ref)
		local useSingleSignOn = getAppFeaturePolicies().getUseSingleSignOn()
		
		return (if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCredential(p5, p6, p7, "Username") else loginRequestsModule.logByUsername(p5, p6, p7, p9, p11)):andThen(function(p13) --[[ line: 59 ]]
			-- upvalues: loginResultModule (copy), getAppFeaturePolicies (copy), useSingleSignOn (ref), promiseModule (copy), loginErrorCodesModule (copy), getFFlagEnableGenericTwoFAMessage (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), p6 (copy)
			assert(p13, "no login attempt result")
			assert(#p13 == 1, "no result or more than one result")
			local var18 = loginResultModule.fromJsonData(p13[1])
			assert(var18, "result invalid")
			local var19 = getAppFeaturePolicies()
			
			if (useSingleSignOn and not var19.getLinkedAuthEndpointsEnabled() or not var19.getWebViewSupport()) and var18 and loginResultModule.hasTwoStepData(var18) then
				return promiseModule.reject({
					errorCode = loginErrorCodesModule.ServiceUnavailable,
					errorKey = if getFFlagEnableGenericTwoFAMessage() then "Authentication.Login.Response.Require2FAGeneric" else "Authentication.Login.Response.Require2FA"
				})
			elseif fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Username)
			end
			if fFlagEnableRecordLogin then
				pcall(function() --[[ line: 85 ]]
					-- upvalues: recordLoginModule (copy), var18 (ref), loginMethodsModule (copy), p6 (copy)
					recordLoginModule(var18, loginMethodsModule.Username, p6)
				end)
			end
			return var18
		end, function(p14) --[[ line: 91 ]]
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p8 (copy), p6 (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), p12 (ref), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername (copy), enablePasskeyOnlyUserErrorMessage (copy), useSingleSignOn (ref), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), promiseModule (copy), p10 (copy)
			local body = httpService:JSONDecode(p14.Body)
			local var21 = nil
			local code = body.errors[1].code
			local var22 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var21 = "Authentication.Login.Response.IncorrectUsernamePassword"
			elseif code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var24, var25 = getCaptchaDataJsonModule(body)
				var24 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "username",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = p8,
						captchaId = var24,
						cvalue = p6,
						dxBlob = var25
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var4.down(var4.fromLegacyPage(var24))
				else
					p12:dispatch(navigateDown(var24))
				end
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var21 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var22 = fieldData
						var21 = nil
					end
				end
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var21 = "Authentication.Login.Response.ServiceUnavailable"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByUsername and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var21 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif enablePasskeyOnlyUserErrorMessage and code == loginErrorCodesModule.PasskeyOnlyUser then
				var21 = "Authentication.Login.Error.PasskeyOnlyAccount"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var21 = "Authentication.Login.Response.SomethingWentWrong"
			end
			if useSingleSignOn then
				warn("Login ErrorCode:", code)
				var21 = getLoginByUsernameErrorMessageModule(code)
				loggingProtocolModule.default:logRobloxTelemetryEvent(loginByUsernameSSOErrorsTelemetryModule, nil, {
					ssoErrorCode = code,
					msgShown = if var21[1] then var21[1] else var21
				})
			end
			return promiseModule.reject({
				errorKey = var21,
				errorCode = code,
				securityQuestionsData = var22,
				securityQuestionsCallback = p10,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end