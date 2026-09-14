local authSignup = script:FindFirstAncestor("AuthSignup")
local parent = authSignup.Parent
local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local promiseModule = require(parent.Promise)
local signUpRequestsModule = require(authSignup.Requests.SignUpRequests)
local signUpV2ErrorCodesModule = require(authSignup.Enums.SignUpV2ErrorCodes)
local appSignupCounterNamesModule = require(authSignup.Enums.AppSignupCounterNames)
local notificationType = require(parent.RobloxAppEnums).NotificationType
local authCommonModule = require(parent.AuthCommon)
local authMemStorageKeys = authCommonModule.Enums.AuthMemStorageKeys
local reportEphemeralCounter = authCommonModule.Analytics.reportEphemeralCounter
local statusCodes = require(parent.Http).StatusCodes
local logger = require(parent.Loggers).Logger
local fFlagDisableMemStorageServicePasswordEvent = require(parent.SharedFlags).FFlagDisableMemStorageServicePasswordEvent
local credentialsProtocolModule = require(parent.CredentialsProtocol)
local constants = credentialsProtocolModule.Constants
local default = credentialsProtocolModule.CredentialsProtocol.default

local function _(value, p1)
	-- upvalues: signUpRequestsModule (ref)
	return signUpRequestsModule.signUpV2(value, p1, {})
end

return function(p1, _, p2, _, _, p3, p4, _, _)
	-- upvalues: signUpRequestsModule (ref), notificationType (ref), reportEphemeralCounter (ref), appSignupCounterNamesModule (ref), fFlagDisableMemStorageServicePasswordEvent (ref), memStorageService (ref), authMemStorageKeys (ref), httpService (ref), default (ref), constants (ref), logger (ref), promiseModule (ref), signUpV2ErrorCodesModule (ref), statusCodes (ref)
	return signUpRequestsModule.signUpV2(p1, p3, {}):andThen(function(p5)
		-- upvalues: p2 (ref), notificationType (copy), reportEphemeralCounter (copy), appSignupCounterNamesModule (copy), p3 (ref), fFlagDisableMemStorageServicePasswordEvent (copy), memStorageService (copy), authMemStorageKeys (copy), httpService (copy), p4 (ref), default (copy), constants (copy), logger (copy), promiseModule (copy)
		p2:BroadcastNotification("", notificationType.DID_SIGN_UP)
		reportEphemeralCounter(appSignupCounterNamesModule.Success, 1)
		
		if not fFlagDisableMemStorageServicePasswordEvent and (p3.username and (p3.password and string.len(p3.password) > 0)) then
			memStorageService:Fire(authMemStorageKeys.AuthenticatedCredentials, httpService:JSONEncode({
				authType = "signup",
				cvalue = p3.username,
				password = p3.password
			}))
		end
		if p4 and p3.password and #p3.password > 0 then
			default:registerCredentials(default.CredentialsTypes.password, httpService:JSONEncode({ username = p3.username, password = p3.password }), constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(p6)
				-- upvalues: httpService (copy), logger (copy)
				local var1 = if p6 then httpService:JSONDecode(p6) else {}
				
				if var1 and var1.errorCode == nil then
					logger:info("Successfully registered password.")
					
					return
				end
				logger:warning("Error registering password: " .. tostring(var1.errorMsg))
			end, function(p6)
				-- upvalues: logger (copy)
				logger:warning("Error registering password: " .. tostring(p6))
			end):await()
		end
		return promiseModule.resolve(p5)
	end, function(p5)
		-- upvalues: httpService (copy), reportEphemeralCounter (copy), appSignupCounterNamesModule (copy), signUpV2ErrorCodesModule (copy), statusCodes (copy), promiseModule (copy)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p5 (ref)
			return httpService:JSONDecode(p5.Body)
		end)
		
		if not ok then
			return promiseModule.reject()
		end
		local code = status.errors and (status.errors[1] and status.errors[1].code)
		reportEphemeralCounter(appSignupCounterNamesModule.Failure, 1)
		
		if code == signUpV2ErrorCodesModule.Captcha then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureCaptcha, 1)
		elseif code == signUpV2ErrorCodesModule.TooManyAttempts then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureThrottled, 1)
		elseif code == signUpV2ErrorCodesModule.InvalidBirthdate then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureBirthdayInvalid, 1)
		elseif code == signUpV2ErrorCodesModule.InvalidUsername then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureUsernameInvalid, 1)
		elseif code == signUpV2ErrorCodesModule.UsernameAlreadyTaken then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureUsernameTaken, 1)
		elseif code == signUpV2ErrorCodesModule.InvalidPassword then
			reportEphemeralCounter(appSignupCounterNamesModule.FailurePasswordInvalid, 1)
		elseif code == signUpV2ErrorCodesModule.UsernameAndPasswordTheSame then
			reportEphemeralCounter(appSignupCounterNamesModule.FailurePasswordMatchesUsername, 1)
		elseif code == signUpV2ErrorCodesModule.UnavailableInRegion then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureUnavailableInRegion, 1)
		elseif code == signUpV2ErrorCodesModule.PasswordTooSimple then
			reportEphemeralCounter(appSignupCounterNamesModule.FailurePasswordTooSimple, 1)
		elseif p5.HttpError == Enum.HttpError.OK and p5.StatusCode == statusCodes.TOO_MANY_REQUESTS then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureThrottled, 1)
		elseif p5.HttpError == Enum.HttpError.OK and p5.StatusCode == statusCodes.INTERNAL_SERVER_ERROR then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureInternalServerError, 1)
		elseif p5.HttpError == Enum.HttpError.OK and p5.StatusCode == statusCodes.BAD_REQUEST then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureBadRequest, 1)
		elseif p5.HttpError == Enum.HttpError.OK and p5.StatusCode == statusCodes.NOT_FOUND then
			reportEphemeralCounter(appSignupCounterNamesModule.FailureNotFound, 1)
		else
			reportEphemeralCounter(appSignupCounterNamesModule.FailureUnknownError, 1)
		end
		return promiseModule.reject(code)
	end)
end