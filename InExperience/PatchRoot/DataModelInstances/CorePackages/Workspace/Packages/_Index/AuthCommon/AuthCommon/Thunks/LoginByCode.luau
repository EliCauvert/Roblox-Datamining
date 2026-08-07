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
local loggingProtocolModule = require(parent.LoggingProtocol)
local loginByUsernameSSOErrorsTelemetryModule = require(authCommon.Utils.LoginByUsernameSSOErrorsTelemetry)
local getLoginByUsernameErrorMessageModule = require(authCommon.Utils.GetLoginByUsernameErrorMessage)
local loginMethodsModule = require(authCommon.Enums.LoginMethods)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local recordLoginModule = require(authCommon.Utils.recordLogin)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local getDxBlobModule = require(authCommon.Utils.GetDxBlob)
local getCaptchaDataJsonModule = require(authCommon.Utils.GetCaptchaDataJson)
local getFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local fFlagEnableLastLoginMethodTracking = require(parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local fFlagEnableRecordLogin = require(parent.SharedFlags).FFlagEnableRecordLogin
local enableIllegalChildAccountLinkingErrorMessageOnLoginByCode = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode", false)

local function _(p0, p1, p2, p3, p4) --[[ line: 35 | named "loginRequest" ]]
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref)
	return if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCode(p0, p1, p2) else loginRequestsModule.loginWithCode(p0, p1, p2, p3, p4)
end

return function(p5, p6, p7, p8, p9, p10, p11) --[[ line: 44 | named "loginByCode" ]]
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), httpService (ref), loginErrorCodesModule (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByCode (ref), getLoginByUsernameErrorMessageModule (ref), loggingProtocolModule (ref), loginByUsernameSSOErrorsTelemetryModule (ref), promiseModule (ref)
	return function(p12) --[[ line: 53 ]]
		-- upvalues: getAppFeaturePolicies (copy), p5 (ref), p6 (ref), p7 (ref), p9 (ref), p11 (ref), loginRequestsModule (copy), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p8 (ref), fFlagSignalsNavP3Dispatch (copy), var4 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByCode (copy), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), promiseModule (copy), p10 (ref)
		local useSingleSignOn = getAppFeaturePolicies().getUseSingleSignOn()
		
		return (if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCode(p5, p6, p7) else loginRequestsModule.loginWithCode(p5, p6, p7, p9, p11)):andThen(function(p13) --[[ line: 56 ]]
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy)
			assert(p13, "no login attempt result")
			assert(#p13 == 1, "no result or more than one result")
			assert(loginResultModule.fromJsonData(p13[1]), "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.QuickLogin)
			end
			local var17 = loginResultModule.fromJsonData(p13[1])
			
			if fFlagEnableRecordLogin then
				pcall(function() --[[ line: 65 ]]
					-- upvalues: recordLoginModule (copy), var17 (ref), loginMethodsModule (copy)
					recordLoginModule(var17, loginMethodsModule.QuickLogin, var17.user.name)
				end)
			end
			return var17
		end, function(p14) --[[ line: 71 ]]
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p8 (copy), p6 (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), p12 (ref), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByCode (copy), useSingleSignOn (ref), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), promiseModule (copy), p10 (copy)
			local body = httpService:JSONDecode(p14.Body)
			local code = body and (body.errors and (body.errors[1] and body.errors[1].code))
			local var20 = nil
			local var21 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var23, var24 = getCaptchaDataJsonModule(body)
				var23 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "authToken",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = p8,
						captchaId = var23,
						cvalue = p6,
						dxBlob = var24
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var4.down(var4.fromLegacyPage(var23))
				else
					p12:dispatch(navigateDown(var23))
				end
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var21 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var20 = fieldData
						var21 = nil
					end
				end
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByCode and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var21 = "Authentication.Login.LinkIllegalChildAccountLinking"
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
				securityQuestionsData = var20,
				securityQuestionsCallback = p10,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end