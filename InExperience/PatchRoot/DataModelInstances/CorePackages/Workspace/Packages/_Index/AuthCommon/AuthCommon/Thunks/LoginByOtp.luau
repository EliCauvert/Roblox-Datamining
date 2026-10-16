local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local LoginRequestsModule = require(AuthCommon.Http.Requests.LoginRequests)
local LoginResultModule = require(AuthCommon.Models.LoginResult)
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local LoginMethodsModule = require(AuthCommon.Enums.LoginMethods)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local GetMultipleUsersPerCredentialErrorDataModule = require(AuthCommon.Utils.GetMultipleUsersPerCredentialErrorData)
local GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction = require(Parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local GetFFlagEnableLoginAccountSelectorFunction = require(Parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local FFlagEnableLastLoginMethodTracking = require(Parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp", false)

return function(p1, p2, p3, SecurityQuestionsCallback, p4, p5) --[[ Line: 23 | Named "loginByOtp" ]]
	-- upvalues: LoginRequestsModule (copy), LoginResultModule (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethodsModule (copy), HttpService (copy), LoginErrorCodesModule (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (copy), GetFFlagEnableLoginAccountSelectorFunction (copy), GetMultipleUsersPerCredentialErrorDataModule (copy), PromiseModule (copy), EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (copy)
	return function() --[[ Line: 31 ]]
		-- upvalues: LoginRequestsModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), LoginResultModule (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), HttpService (upval), LoginErrorCodesModule (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), GetMultipleUsersPerCredentialErrorDataModule (upval), PromiseModule (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (upval), SecurityQuestionsCallback (copy)
		return LoginRequestsModule.logByOtp(p1, p2, p3, p4, p5):andThen(function(Entry) --[[ Line: 33 ]]
			-- upvalues: LoginResultModule (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval)
			assert(Entry, "no login attempt result")
			assert(#Entry == 1, "no result or more than one result")
			assert(LoginResultModule.fromJsonData(Entry[1]), "result invalid")
			
			if FFlagEnableLastLoginMethodTracking then
				AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(LoginMethodsModule.EmailOtp)
			end
			return LoginResultModule.fromJsonData(Entry[1])
		end, function(p6) --[[ Line: 41 ]]
			-- upvalues: HttpService (upval), LoginErrorCodesModule (upval), GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction (upval), GetFFlagEnableLoginAccountSelectorFunction (upval), GetMultipleUsersPerCredentialErrorDataModule (upval), PromiseModule (upval), EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp (upval), SecurityQuestionsCallback (upval)
			local Data = HttpService:JSONDecode(p6.Body)
			local ErrorKey: string? = nil
			local Code = Data.errors[1].code
			local SecurityQuestionsData = nil
			local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
			
			if Code == LoginErrorCodesModule.IncorrectCValueOrPassword then
				ErrorKey = "Authentication.Login.Response.IncorrectOtpCode"
			elseif GetFFlagLuaAppUsingSecurityQuestionsForLuaLoginFunction() and Code == LoginErrorCodesModule.SecurityQuestions then
				ErrorKey = "Authentication.Login.Response.SomethingWentWrong"
				
				if Data.errors[1].fieldData then
					local Data1 = HttpService:JSONDecode(Data.errors[1].fieldData)
					
					if Data1.sessionId and Data1.userId then
						SecurityQuestionsData = Data1
						ErrorKey = nil
					end
				end
			else
				if GetFFlagEnableLoginAccountSelectorFunction() and Code == LoginErrorCodesModule.MultipleUsersPerCredential then
					return PromiseModule.reject({
						errorKey = ErrorKey,
						errorCode = Code,
						usersData = GetMultipleUsersPerCredentialErrorDataModule(Data)
					})
				end
				if Code == LoginErrorCodesModule.ServiceUnavailable then
					ErrorKey = "Authentication.Login.Response.ServiceUnavailable"
				elseif EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp and Code == LoginErrorCodesModule.IllegalChildAccountLinking then
					ErrorKey = "Authentication.Login.LinkIllegalChildAccountLinking"
				elseif Code ~= LoginErrorCodesModule.AccountLocked then
					ErrorKey = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod"
				end
			end
			return PromiseModule.reject({
				errorKey = ErrorKey,
				errorCode = Code,
				securityQuestionsData = SecurityQuestionsData,
				securityQuestionsCallback = SecurityQuestionsCallback,
				userFacingMessage = UserFacingMessage
			})
		end)
	end
end