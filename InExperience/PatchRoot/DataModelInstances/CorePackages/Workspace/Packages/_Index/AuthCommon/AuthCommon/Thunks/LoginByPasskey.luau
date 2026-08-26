local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local loginRequestsModule = require(authCommon.Http.Requests.LoginRequests)
local loginResultModule = require(authCommon.Models.LoginResult)
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local loginMethodsModule = require(authCommon.Enums.LoginMethods)
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local fFlagEnableLastLoginMethodTracking = require(parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local fFlagEnableRecordLogin = require(parent.SharedFlags).FFlagEnableRecordLogin
local logger = require(parent.Loggers).Logger
local recordLoginModule = require(authCommon.Utils.recordLogin)

return function(p1, p2, p3)
	-- upvalues: loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), logger (ref), httpService (ref), loginErrorCodesModule (ref), promiseModule (ref)
	return function(_)
		-- upvalues: loginRequestsModule (copy), p1 (ref), p2 (ref), p3 (ref), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), logger (copy), httpService (copy), loginErrorCodesModule (copy), promiseModule (copy)
		return loginRequestsModule.logByPasskey(p1, p2, p3):andThen(function(p4)
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy)
			assert(p4, "no login attempt result")
			assert(#p4 == 1, "no result or more than one result")
			local var1 = loginResultModule.fromJsonData(p4[1])
			assert(var1, "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Passkey)
			end
			if fFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: recordLoginModule (copy), var1 (ref), loginMethodsModule (copy)
					recordLoginModule(var1, loginMethodsModule.Passkey, var1.user.name)
				end)
			end
			return var1
		end, function(p4)
			-- upvalues: logger (copy), httpService (copy), loginErrorCodesModule (copy), promiseModule (copy)
			logger:error("Error logging in by passkey. Error: {}", p4.Body)
			local body = httpService:JSONDecode(p4.Body)
			local code = body.errors[1].code
			local var1 = "Authentication.Login.Response.SomethingWentWrong"
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var1 = "Authentication.Login.Response.InvalidPasskeyCredential"
			end
			return promiseModule.reject({
				errorCode = code,
				errorKey = var1,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end