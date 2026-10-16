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
local getMultipleUsersPerCredentialErrorDataModule = require(authCommon.Utils.GetMultipleUsersPerCredentialErrorData)
local loginMethodsModule = require(authCommon.Enums.LoginMethods)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local recordLoginModule = require(authCommon.Utils.recordLogin)
local getDxBlobModule = require(authCommon.Utils.GetDxBlob)
local getCaptchaDataJsonModule = require(authCommon.Utils.GetCaptchaDataJson)
local getFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local getFFlagEnableLoginAccountSelector = require(parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local fFlagEnableLastLoginMethodTracking = require(parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local fFlagEnableRecordLogin = require(parent.SharedFlags).FFlagEnableRecordLogin
local enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByPhone", false)

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), httpService (ref), loginErrorCodesModule (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), getMultipleUsersPerCredentialErrorDataModule (ref), promiseModule (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone (ref)
	return function(p9)
		-- upvalues: loginRequestsModule (copy), p1 (ref), p2 (ref), p3 (ref), p5 (ref), p7 (ref), p8 (ref), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone (copy), p6 (ref)
		return loginRequestsModule.logByPhone(p1, p2, p3, p5, p7, p8):andThen(function(p10)
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), p2 (copy)
			assert(p10, "no login attempt result")
			assert(#p10 == 1, "no result or more than one result")
			assert(loginResultModule.fromJsonData(p10[1]), "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Phone)
			end
			local var2 = loginResultModule.fromJsonData(p10[1])
			
			if fFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: recordLoginModule (copy), var2 (ref), loginMethodsModule (copy), p2 (copy)
					recordLoginModule(var2, loginMethodsModule.Phone, p2)
				end)
			end
			return var2
		end, function(p10)
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p4 (copy), p2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), p9 (ref), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone (copy), p6 (copy)
			local body = httpService:JSONDecode(p10.Body)
			local var2 = nil
			local code = body.errors[1].code
			local var3 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var2 = "Authentication.Login.Response.IncorrectPhoneOrPassword"
			elseif code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var4, var5 = getCaptchaDataJsonModule(body)
				var4 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "phonenumber",
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
					p9:dispatch(navigateDown(var4))
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
			elseif getFFlagEnableLoginAccountSelector() and code == loginErrorCodesModule.MultipleUsersPerCredential then
				return promiseModule.reject({
					errorKey = var2,
					errorCode = code,
					usersData = getMultipleUsersPerCredentialErrorDataModule(body),
					userFacingMessage = userFacingMessage
				})
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var2 = "Authentication.Login.Response.ServiceUnavailable"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var2 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var2 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
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