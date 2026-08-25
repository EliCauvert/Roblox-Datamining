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

return function(p0, p1, p2)
	-- upvalues: loginRequestsModule (ref), loginResultModule (ref), fFlagEnableLastLoginMethodTracking (ref), appStorageUtilitiesModule (ref), loginMethodsModule (ref), fFlagEnableRecordLogin (ref), recordLoginModule (ref), logger (ref), httpService (ref), loginErrorCodesModule (ref), promiseModule (ref)
	return function(_)
		-- upvalues: loginRequestsModule (copy), p0 (ref), p1 (ref), p2 (ref), loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy), logger (copy), httpService (copy), loginErrorCodesModule (copy), promiseModule (copy)
		return loginRequestsModule.logByPasskey(p0, p1, p2):andThen(function(p3)
			-- upvalues: loginResultModule (copy), fFlagEnableLastLoginMethodTracking (copy), appStorageUtilitiesModule (copy), loginMethodsModule (copy), fFlagEnableRecordLogin (copy), recordLoginModule (copy)
			assert(p3, "no login attempt result")
			assert(#p3 == 1, "no result or more than one result")
			local var9 = loginResultModule.fromJsonData(p3[1])
			assert(var9, "result invalid")
			
			if fFlagEnableLastLoginMethodTracking then
				appStorageUtilitiesModule.setLastSuccessfulSignInMethod(loginMethodsModule.Passkey)
			end
			if fFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: recordLoginModule (copy), var9 (ref), loginMethodsModule (copy)
					recordLoginModule(var9, loginMethodsModule.Passkey, var9.user.name)
				end)
			end
			return var9
		end, function(p4)
			-- upvalues: logger (copy), httpService (copy), loginErrorCodesModule (copy), promiseModule (copy)
			logger:error("Error logging in by passkey. Error: {}", p4.Body)
			local body = httpService:JSONDecode(p4.Body)
			local code = body.errors[1].code
			local var11 = "Authentication.Login.Response.SomethingWentWrong"
			local userFacingMessage = body and (body.errors and (body.errors[1] and body.errors[1].userFacingMessage))
			
			if code == loginErrorCodesModule.IncorrectCValueOrPassword then
				var11 = "Authentication.Login.Response.InvalidPasskeyCredential"
			end
			return promiseModule.reject({
				errorCode = code,
				errorKey = var11,
				userFacingMessage = userFacingMessage
			})
		end)
	end
end