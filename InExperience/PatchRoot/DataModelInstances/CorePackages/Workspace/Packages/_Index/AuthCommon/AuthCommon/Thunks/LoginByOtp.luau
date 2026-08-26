local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local loginRequestsModule = require(authCommon.Http.Requests.LoginRequests)
local loginResultModule = require(authCommon.Models.LoginResult)
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local loginMethodsModule = require(authCommon.Enums.LoginMethods)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local getMultipleUsersPerCredentialErrorDataModule = require(authCommon.Utils.GetMultipleUsersPerCredentialErrorData)
local getFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local getFFlagEnableLoginAccountSelector = require(parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local fFlagEnableLastLoginMethodTracking = require(parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp", false)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), httpService (ref), loginErrorCodesModule (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), getMultipleUsersPerCredentialErrorDataModule (ref), promiseModule (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (ref)
	return function()
		-- upvalues: loginRequestsModule (copy), p1 (ref), p2 (ref), p3 (ref), p5 (ref), p6 (ref), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), httpService (copy), loginErrorCodesModule (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (copy), p4 (ref)
		return loginRequestsModule.logByOtp(p1, p2, p3, p5, p6):andThen(function(p7)
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy)
			assert(p7, "no login attempt result")
			assert(#p7 == 1, "no result or more than one result")
			assert(loginResultModule.fromJsonData(p7[1]), "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.EmailOtp)
			end
			return loginResultModule.fromJsonData(p7[1])
		end, function(p7)
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (copy), p4 (copy)
			local body = httpService:JSONDecode(p7.Body)
			local var1 = nil
			local code = body.errors[1].code
			local var2 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var1 = "Authentication.Login.Response.IncorrectOtpCode"
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var1 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var2 = fieldData
						var1 = nil
					end
				end
			elseif getFFlagEnableLoginAccountSelector() and code == loginErrorCodesModule.MultipleUsersPerCredential then
				return promiseModule.reject({
					errorKey = var1,
					errorCode = code,
					usersData = getMultipleUsersPerCredentialErrorDataModule(body)
				})
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var1 = "Authentication.Login.Response.ServiceUnavailable"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var1 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var1 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
			end
			return promiseModule.reject({
				errorKey = var1,
				errorCode = code,
				securityQuestionsData = var2,
				securityQuestionsCallback = p4,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end