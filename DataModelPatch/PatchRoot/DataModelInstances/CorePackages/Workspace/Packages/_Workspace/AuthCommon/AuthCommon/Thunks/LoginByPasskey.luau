local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local LoginRequestsModule = require(AuthCommon.Http.Requests.LoginRequests)
local LoginResultModule = require(AuthCommon.Models.LoginResult)
local LoginErrorCodesModule = require(AuthCommon.Enums.LoginErrorCodes)
local LoginMethodsModule = require(AuthCommon.Enums.LoginMethods)
local AppStorageUtilitiesModule = require(AuthCommon.Utils.AppStorageUtilities)
local FFlagEnableLastLoginMethodTracking = require(Parent.SharedFlags).FFlagEnableLastLoginMethodTracking
local FFlagEnableRecordLogin = require(Parent.SharedFlags).FFlagEnableRecordLogin
local Logger = require(Parent.Loggers).Logger
local RecordLoginModule = require(AuthCommon.Utils.recordLogin)

return function(p1, p2, p3)
	-- upvalues: LoginRequestsModule (copy), LoginResultModule (copy), FFlagEnableLastLoginMethodTracking (copy), AppStorageUtilitiesModule (copy), LoginMethodsModule (copy), FFlagEnableRecordLogin (copy), RecordLoginModule (copy), Logger (copy), HttpService (copy), LoginErrorCodesModule (copy), PromiseModule (copy)
	return function(_)
		-- upvalues: LoginRequestsModule (upval), p1 (copy), p2 (copy), p3 (copy), LoginResultModule (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval), Logger (upval), HttpService (upval), LoginErrorCodesModule (upval), PromiseModule (upval)
		return LoginRequestsModule.logByPasskey(p1, p2, p3):andThen(function(Entry)
			-- upvalues: LoginResultModule (upval), FFlagEnableLastLoginMethodTracking (upval), AppStorageUtilitiesModule (upval), LoginMethodsModule (upval), FFlagEnableRecordLogin (upval), RecordLoginModule (upval)
			assert(Entry, "no login attempt result")
			assert(#Entry == 1, "no result or more than one result")
			local FromJsonDataResult = LoginResultModule.fromJsonData(Entry[1])
			assert(FromJsonDataResult, "result invalid")
			
			if FFlagEnableLastLoginMethodTracking then
				AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(LoginMethodsModule.Passkey)
			end
			if FFlagEnableRecordLogin then
				pcall(function()
					-- upvalues: RecordLoginModule (upval), FromJsonDataResult (copy), LoginMethodsModule (upval)
					RecordLoginModule(FromJsonDataResult, LoginMethodsModule.Passkey, FromJsonDataResult.user.name)
				end)
			end
			return FromJsonDataResult
		end, function(p4)
			-- upvalues: Logger (upval), HttpService (upval), LoginErrorCodesModule (upval), PromiseModule (upval)
			Logger:error("Error logging in by passkey. Error: {}", p4.Body)
			local Data = HttpService:JSONDecode(p4.Body)
			local Code = Data.errors[1].code
			local ErrorKey = "Authentication.Login.Response.SomethingWentWrong"
			local UserFacingMessage = Data and (Data.errors and (Data.errors[1] and Data.errors[1].userFacingMessage))
			
			if Code == LoginErrorCodesModule.IncorrectCValueOrPassword then
				ErrorKey = "Authentication.Login.Response.InvalidPasskeyCredential"
			end
			return PromiseModule.reject({
				errorCode = Code,
				errorKey = ErrorKey,
				userFacingMessage = UserFacingMessage
			})
		end)
	end
end