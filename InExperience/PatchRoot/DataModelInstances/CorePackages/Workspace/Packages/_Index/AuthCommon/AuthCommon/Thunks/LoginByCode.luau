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

local function _(p1, p2, p3, p4, p5)
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref)
	return if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCode(p1, p2, p3) else loginRequestsModule.loginWithCode(p1, p2, p3, p4, p5)
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getAppFeaturePolicies (ref), loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), httpService (ref), loginErrorCodesModule (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByCode (ref), getLoginByUsernameErrorMessageModule (ref), loggingProtocolModule (ref), loginByUsernameSSOErrorsTelemetryModule (ref), promiseModule (ref)
	return function(p8)
		-- upvalues: getAppFeaturePolicies (copy), p1 (ref), p2 (ref), p3 (ref), p5 (ref), p7 (ref), loginRequestsModule (copy), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByCode (copy), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), promiseModule (copy), p6 (ref)
		local useSingleSignOn = getAppFeaturePolicies().getUseSingleSignOn()
		
		return (if getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCode(p1, p2, p3) else loginRequestsModule.loginWithCode(p1, p2, p3, p5, p7)):andThen(function(p9)
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy)
			assert(p9, "no login attempt result")
			assert(#p9 == 1, "no result or more than one result")
			assert(loginResultModule.fromJsonData(p9[1]), "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.QuickLogin)
			end
			local var2 = loginResultModule.fromJsonData(p9[1])
			
			if fFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: recordLoginModule (copy), var2 (ref), loginMethodsModule (copy)
					recordLoginModule(var2, loginMethodsModule.QuickLogin, var2.user.name)
				end)
			end
			return var2
		end, function(p9)
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (copy), p2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p8 (ref), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByCode (copy), useSingleSignOn (ref), getLoginByUsernameErrorMessageModule (copy), loggingProtocolModule (copy), loginByUsernameSSOErrorsTelemetryModule (copy), promiseModule (copy), p6 (copy)
			local body = httpService:JSONDecode(p9.Body)
			local code = body and (body.errors and (body.errors[1] and body.errors[1].code))
			local var2 = nil
			local var3 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var4, var5 = getCaptchaDataJsonModule(body)
				var4 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "authToken",
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
				var3 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var2 = fieldData
						var3 = nil
					end
				end
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByCode and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var3 = "Authentication.Login.LinkIllegalChildAccountLinking"
			end
			if useSingleSignOn then
				warn("Login ErrorCode:", code)
				var3 = getLoginByUsernameErrorMessageModule(code)
				loggingProtocolModule.default:logRobloxTelemetryEvent(loginByUsernameSSOErrorsTelemetryModule, nil, {
					ssoErrorCode = code,
					msgShown = if var3[1] then var3[1] else var3
				})
			end
			return promiseModule.reject({
				errorKey = var3,
				errorCode = code,
				securityQuestionsData = var2,
				securityQuestionsCallback = p6,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end