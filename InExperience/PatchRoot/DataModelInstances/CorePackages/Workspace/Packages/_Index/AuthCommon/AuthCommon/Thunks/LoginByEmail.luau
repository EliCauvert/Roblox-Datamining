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
local loginMethodsModule = require(authCommon.Enums.LoginMethods)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local getMultipleUsersPerCredentialErrorDataModule = require(authCommon.Utils.GetMultipleUsersPerCredentialErrorData)
local getDxBlobModule = require(authCommon.Utils.GetDxBlob)
local getCaptchaDataJsonModule = require(authCommon.Utils.GetCaptchaDataJson)
local getLoginByCredentialSsoErrorMessageModule = require(authCommon.Utils.GetLoginByCredentialSsoErrorMessage)
local loginByEmailSSOErrorsTelemetryModule = require(authCommon.Utils.LoginByEmailSSOErrorsTelemetry)
local getFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local getFFlagEnableLoginAccountSelector = require(parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local getFFlagEnableGenericTwoFAMessage = require(parent.SharedFlags).GetFFlagEnableGenericTwoFAMessage
local fFlagEnableLastLoginMethodTracking = require(parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local recordLoginModule = require(authCommon.Utils.recordLogin)
local fFlagEnableRecordLogin = require(parent.SharedFlags).FFlagEnableRecordLogin
local loggingProtocolModule = require(parent.LoggingProtocol)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local enableIllegalChildAccountLinkingErrorMessageOnLoginByEmail = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail", false)
local fFlagEnableEmailSsoConnectModule = require(authCommon.Flags.FFlagEnableEmailSsoConnect)

local function loginRequest(p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagEnableEmailSsoConnectModule (ref), getAppFeaturePolicies (ref), loginRequestsModule (ref)
	return if fFlagEnableEmailSsoConnectModule and getAppFeaturePolicies().getUseSingleSignOn() then loginRequestsModule.singleSignOnConnectWithCredential(p1, p2, p3, "Email") else loginRequestsModule.logByEmail(p1, p2, p3, p4, p5, p6)
end

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: fFlagEnableEmailSsoConnectModule (ref), getAppFeaturePolicies (ref), loginRequest (ref), loginResultModule (ref), promiseModule (ref), loginErrorCodesModule (ref), getFFlagEnableGenericTwoFAMessage (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), httpService (ref), getLoginByCredentialSsoErrorMessageModule (ref), loggingProtocolModule (ref), loginByEmailSSOErrorsTelemetryModule (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), getMultipleUsersPerCredentialErrorDataModule (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByEmail (ref)
	return function(p9)
		-- upvalues: fFlagEnableEmailSsoConnectModule (copy), getAppFeaturePolicies (copy), loginRequest (copy), p1 (ref), p2 (ref), p3 (ref), p5 (ref), p7 (ref), p8 (ref), loginResultModule (copy), promiseModule (copy), loginErrorCodesModule (copy), getFFlagEnableGenericTwoFAMessage (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), httpService (copy), getLoginByCredentialSsoErrorMessageModule (copy), loggingProtocolModule (copy), loginByEmailSSOErrorsTelemetryModule (copy), p6 (ref), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByEmail (copy)
		local var2 = fFlagEnableEmailSsoConnectModule and getAppFeaturePolicies().getUseSingleSignOn()
		
		return loginRequest(p1, p2, p3, p5, p7, p8):andThen(function(p10)
			-- upvalues: loginResultModule (copy), var2 (ref), getAppFeaturePolicies (copy), promiseModule (copy), loginErrorCodesModule (copy), getFFlagEnableGenericTwoFAMessage (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), p2 (copy)
			assert(p10, "no login attempt result")
			assert(#p10 == 1, "no result or more than one result")
			local var3 = loginResultModule.fromJsonData(p10[1])
			assert(var3, "result invalid")
			
			if var2 then
				local var4 = getAppFeaturePolicies()
				
				if (not var4.getLinkedAuthEndpointsEnabled() or not var4.getWebViewSupport()) and loginResultModule.hasTwoStepData(var3) then
					return promiseModule.reject({
						errorCode = loginErrorCodesModule.ServiceUnavailable,
						errorKey = if getFFlagEnableGenericTwoFAMessage() then "Authentication.Login.Response.Require2FAGeneric" else "Authentication.Login.Response.Require2FA"
					})
				elseif fFlagEnableLastLoginMethodTracking then
					appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Email)
				end
				if fFlagEnableRecordLogin then
					pcall(function()
						-- upvalues: recordLoginModule (copy), var3 (ref), loginMethodsModule (copy), p2 (copy)
						recordLoginModule(var3, loginMethodsModule.Email, p2)
					end)
				end
				return var3
			end
		end, function(p10)
			-- upvalues: httpService (copy), var2 (ref), getLoginByCredentialSsoErrorMessageModule (copy), loggingProtocolModule (copy), loginByEmailSSOErrorsTelemetryModule (copy), promiseModule (copy), p6 (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (copy), p2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p9 (ref), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByEmail (copy)
			local body = httpService:JSONDecode(p10.Body)
			local var3 = nil
			local code = body.errors[1].code
			local var4 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if var2 then
				warn("Login ErrorCode:", code)
				var3 = getLoginByCredentialSsoErrorMessageModule.getMessage(code, "Authentication.Login.Response.IncorrectEmailOrPassword", "Authentication.Login.Response.UnverifiedEmailLoginWithUsername")
				loggingProtocolModule.default:logRobloxTelemetryEvent(loginByEmailSSOErrorsTelemetryModule, nil, {
					ssoErrorCode = code,
					msgShown = if type(var3) == "table" then var3[1] else var3
				})
				
				return promiseModule.reject({
					errorKey = var3,
					errorCode = getLoginByCredentialSsoErrorMessageModule.getUiErrorCode(code),
					securityQuestionsCallback = p6,
					userFacingMessage = userFacingMessage
				})
			elseif code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var3 = "Authentication.Login.Response.IncorrectEmailOrPassword"
			elseif code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var5, var6 = getCaptchaDataJsonModule(body)
				var5 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "email",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = p4,
						captchaId = var5,
						cvalue = p2,
						dxBlob = var6
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(var5))
				else
					p9:dispatch(navigateDown(var5))
				end
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var3 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var4 = fieldData
						var3 = nil
					end
				end
			elseif getFFlagEnableLoginAccountSelector() and code == loginErrorCodesModule.MultipleUsersPerCredential then
				return promiseModule.reject({
					errorKey = var3,
					errorCode = code,
					usersData = getMultipleUsersPerCredentialErrorDataModule(body)
				})
			elseif code == loginErrorCodesModule.MoreThanOneUsername then
				var3 = "Authentication.Login.Response.MoreThanOneUsername"
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var3 = "Authentication.Login.Response.ServiceUnavailable"
			elseif code == loginErrorCodesModule.AccountNotVerified then
				var3 = "Authentication.Login.Response.UnverifiedEmailLoginWithUsername"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByEmail and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var3 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var3 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
			end
			return promiseModule.reject({
				errorKey = var3,
				errorCode = code,
				securityQuestionsData = var4,
				securityQuestionsCallback = p6,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end