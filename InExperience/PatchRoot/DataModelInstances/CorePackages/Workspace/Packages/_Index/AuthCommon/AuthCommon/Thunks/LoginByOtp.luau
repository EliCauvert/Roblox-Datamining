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

return function(p0, p1, p2, p3, p4, p5) --[[ line: 23 | named "loginByOtp" ]]
	-- upvalues: loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), httpService (ref), loginErrorCodesModule (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), getMultipleUsersPerCredentialErrorDataModule (ref), promiseModule (ref), enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (ref)
	return function() --[[ line: 31 ]]
		-- upvalues: loginRequestsModule (copy), p0 (ref), p1 (ref), p2 (ref), p4 (ref), p5 (ref), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), httpService (copy), loginErrorCodesModule (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (copy), p3 (ref)
		return loginRequestsModule.logByOtp(p0, p1, p2, p4, p5):andThen(function(p6) --[[ line: 33 ]]
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy)
			assert(p6, "no login attempt result")
			assert(#p6 == 1, "no result or more than one result")
			assert(loginResultModule.fromJsonData(p6[1]), "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.EmailOtp)
			end
			return loginResultModule.fromJsonData(p6[1])
		end, function(p7) --[[ line: 41 ]]
			-- upvalues: httpService (copy), loginErrorCodesModule (copy), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), getFFlagEnableLoginAccountSelector (copy), getMultipleUsersPerCredentialErrorDataModule (copy), promiseModule (copy), enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (copy), p3 (copy)
			local body = httpService:JSONDecode(p7.Body)
			local var11 = nil
			local code = body.errors[1].code
			local var12 = nil
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var11 = "Authentication.Login.Response.IncorrectOtpCode"
			elseif getFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and code == loginErrorCodesModule.SecurityQuestions then
				var11 = "Authentication.Login.Response.SomethingWentWrong"
				
				if body.errors[1].fieldData then
					local fieldData = httpService:JSONDecode(body.errors[1].fieldData)
					
					if fieldData.sessionId and fieldData.userId then
						var12 = fieldData
						var11 = nil
					end
				end
			elseif getFFlagEnableLoginAccountSelector() and code == loginErrorCodesModule.MultipleUsersPerCredential then
				return promiseModule.reject({
					errorKey = var11,
					errorCode = code,
					usersData = getMultipleUsersPerCredentialErrorDataModule(body)
				})
			elseif code == loginErrorCodesModule.ServiceUnavailable then
				var11 = "Authentication.Login.Response.ServiceUnavailable"
			elseif enableIllegalChildAccountLinkingErrorMessageOnLoginByOtp and code == loginErrorCodesModule.IllegalChildAccountLinking then
				var11 = "Authentication.Login.LinkIllegalChildAccountLinking"
			elseif code ~= loginErrorCodesModule.AccountLocked then
				var11 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
			end
			return promiseModule.reject({
				errorKey = var11,
				errorCode = code,
				securityQuestionsData = var12,
				securityQuestionsCallback = p3,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end