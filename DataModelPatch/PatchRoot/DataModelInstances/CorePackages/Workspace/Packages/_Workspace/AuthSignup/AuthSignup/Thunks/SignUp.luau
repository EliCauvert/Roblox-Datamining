local AuthSignup = script:FindFirstAncestor("AuthSignup")
local Parent = AuthSignup.Parent
local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local PromiseModule = require(Parent.Promise)
local SignUpRequestsModule = require(AuthSignup.Requests.SignUpRequests)
local SignUpV2ErrorCodesModule = require(AuthSignup.Enums.SignUpV2ErrorCodes)
local AppSignupCounterNamesModule = require(AuthSignup.Enums.AppSignupCounterNames)
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local AuthCommonModule = require(Parent.AuthCommon)
local AuthMemStorageKeys = AuthCommonModule.Enums.AuthMemStorageKeys
local ReportEphemeralCounterFunction = AuthCommonModule.Analytics.reportEphemeralCounter
local StatusCodes = require(Parent.Http).StatusCodes
local Logger = require(Parent.Loggers).Logger
local FFlagDisableMemStorageServicePasswordEvent = require(Parent.SharedFlags).FFlagDisableMemStorageServicePasswordEvent
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Constants = CredentialsProtocolModule.Constants
local Default = CredentialsProtocolModule.CredentialsProtocol.default

local function _(p1, p2)
	-- upvalues: SignUpRequestsModule (copy)
	return SignUpRequestsModule.signUpV2(p1, p2, {})
end

return function(p1, _, GuiService, _, _, p2, p3, _, _)
	-- upvalues: SignUpRequestsModule (copy), NotificationType (copy), ReportEphemeralCounterFunction (copy), AppSignupCounterNamesModule (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), AuthMemStorageKeys (copy), HttpService (copy), Default (copy), Constants (copy), Logger (copy), PromiseModule (copy), SignUpV2ErrorCodesModule (copy), StatusCodes (copy)
	return SignUpRequestsModule.signUpV2(p1, p2, {}):andThen(function(Result)
		-- upvalues: GuiService (copy), NotificationType (upval), ReportEphemeralCounterFunction (upval), AppSignupCounterNamesModule (upval), p2 (copy), FFlagDisableMemStorageServicePasswordEvent (upval), MemStorageService (upval), AuthMemStorageKeys (upval), HttpService (upval), p3 (copy), Default (upval), Constants (upval), Logger (upval), PromiseModule (upval)
		GuiService:BroadcastNotification("", NotificationType.DID_SIGN_UP)
		ReportEphemeralCounterFunction(AppSignupCounterNamesModule.Success, 1)
		local IsLengthAbove: boolean = p2.username and (p2.password and string.len(p2.password) > 0)
		
		if not FFlagDisableMemStorageServicePasswordEvent and IsLengthAbove then
			MemStorageService:Fire(AuthMemStorageKeys.AuthenticatedCredentials, HttpService:JSONEncode({
				authType = "signup",
				cvalue = p2.username,
				password = p2.password
			}))
		end
		if p3 and p2.password and #p2.password > 0 then
			Default:registerCredentials(Default.CredentialsTypes.password, HttpService:JSONEncode({ username = p2.username, password = p2.password }), Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(Result)
				-- upvalues: HttpService (upval), Logger (upval)
				local Data = if Result then HttpService:JSONDecode(Result) else {}
				
				if Data and Data.errorCode == nil then
					Logger:info("Successfully registered password.")
					
					return
				else
					Logger:warning("Error registering password: " .. tostring(Data.errorMsg))
				end
			end, function(p4)
				-- upvalues: Logger (upval)
				Logger:warning("Error registering password: " .. tostring(p4))
			end):await()
		end
		return PromiseModule.resolve(Result)
	end, function(p4)
		-- upvalues: HttpService (upval), ReportEphemeralCounterFunction (upval), AppSignupCounterNamesModule (upval), SignUpV2ErrorCodesModule (upval), StatusCodes (upval), PromiseModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), p4 (copy)
			return HttpService:JSONDecode(p4.Body)
		end)
		
		if not Success then
			return PromiseModule.reject()
		end
		local Code = Result.errors and (Result.errors[1] and Result.errors[1].code)
		ReportEphemeralCounterFunction(AppSignupCounterNamesModule.Failure, 1)
		
		if Code == SignUpV2ErrorCodesModule.Captcha then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureCaptcha, 1)
		elseif Code == SignUpV2ErrorCodesModule.TooManyAttempts then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureThrottled, 1)
		elseif Code == SignUpV2ErrorCodesModule.InvalidBirthdate then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureBirthdayInvalid, 1)
		elseif Code == SignUpV2ErrorCodesModule.InvalidUsername then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureUsernameInvalid, 1)
		elseif Code == SignUpV2ErrorCodesModule.UsernameAlreadyTaken then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureUsernameTaken, 1)
		elseif Code == SignUpV2ErrorCodesModule.InvalidPassword then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailurePasswordInvalid, 1)
		elseif Code == SignUpV2ErrorCodesModule.UsernameAndPasswordTheSame then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailurePasswordMatchesUsername, 1)
		elseif Code == SignUpV2ErrorCodesModule.UnavailableInRegion then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureUnavailableInRegion, 1)
		elseif Code == SignUpV2ErrorCodesModule.PasswordTooSimple then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailurePasswordTooSimple, 1)
		elseif p4.HttpError == Enum.HttpError.OK and p4.StatusCode == StatusCodes.TOO_MANY_REQUESTS then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureThrottled, 1)
		elseif p4.HttpError == Enum.HttpError.OK and p4.StatusCode == StatusCodes.INTERNAL_SERVER_ERROR then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureInternalServerError, 1)
		elseif p4.HttpError == Enum.HttpError.OK and p4.StatusCode == StatusCodes.BAD_REQUEST then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureBadRequest, 1)
		elseif p4.HttpError == Enum.HttpError.OK and p4.StatusCode == StatusCodes.NOT_FOUND then
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureNotFound, 1)
		else
			ReportEphemeralCounterFunction(AppSignupCounterNamesModule.FailureUnknownError, 1)
		end
		return PromiseModule.reject(Code)
	end)
end