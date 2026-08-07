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

return function(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 32 | named "loginByPhone" ]]
	-- upvalues: loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), httpService (ref), loginErrorCodesModule (ref), getDxBlobModule (ref), getCaptchaDataJsonModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), getMultipleUsersPerCredentialErrorDataModule (ref), promiseModule (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone (ref)
	return function(p8) --[[ line: 42 ]]
		-- upvalues: loginRequestsModule (copy), p0 (ref), p1 (ref), p2 (ref), p4 (ref), p6 (ref), p7 (ref), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p3 (ref), fFlagSignalsNavP3Dispatch (copy), var4 (copy), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone (copy), p5 (ref)
		return loginRequestsModule.logByPhone(p0, p1, p2, p4, p6, p7):andThen(function(p9) --[[ line: 51 ]]
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), p1 (copy)
			assert(p9, "no login attempt result")
			assert(#p9 == 1, "no result or more than one result")
			assert(loginResultModule.fromJsonData(p9[1]), "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Phone)
			end
			local var14 = loginResultModule.fromJsonData(p9[1])
			
			if fFlagEnableRecordLogin then
				pcall(function() --[[ line: 60 ]]
					-- upvalues: recordLoginModule (copy), var14 (ref), loginMethodsModule (copy), p1 (copy)
					recordLoginModule(var14, loginMethodsModule.Phone, p1)
				end)
			end
			return var14
		end, function(p10) --[[ line: 65 ]]
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getDxBlobModule (copy), getCaptchaDataJsonModule (copy), appPage (copy), p3 (copy), p1 (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), p8 (ref), navigateDown (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone (copy), p5 (copy)
			local body = httpService:JSONDecode(p10.Body)
			local var16 = nil
			local code = body.errors[1].code
			local var17 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var16 = "Authentication.Login.Response.IncorrectPhoneOrPassword"
			elseif code == loginErrorCodesModule.Captcha then
				local _ = getDxBlobModule(body)
				local _ = nil
				local var19, var20 = getCaptchaDataJsonModule(body)
				var19 = {
					detail = "",
					name = appPage.CaptchaNative,
					extraProps = {
						captchaType = "login",
						cvalueType = "phonenumber",
						backNavigationDisabledWhileLoading = true,
						captchaCallback = p3,
						captchaId = var19,
						cvalue = p1,
						dxBlob = var20
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var4.down(var4.fromLegacyPage(var19))
				else
					p8:dispatch(navigateDown(var19))
				end
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var16 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var17 = fieldData
						var16 = nil
					end
				end
			elseif getFFlagEnableLoginAccountSelector() and code == loginErrorCodesModule.MultipleUsersPerCredential then
				return promiseModule.reject({
					errorKey = var16,
					errorCode = code,
					usersData = getMultipleUsersPerCredentialErrorDataModule(body),
					userFacingMessage = userFacingMessage
				})
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var16 = "Authentication.Login.Response.ServiceUnavailable"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByPhone and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var16 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var16 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
			end
			return promiseModule.reject({
				errorKey = var16,
				errorCode = code,
				securityQuestionsData = var17,
				securityQuestionsCallback = p5,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end