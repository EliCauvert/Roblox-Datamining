local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local base64Module = require(authCommon.Utils.Base64)
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local default = require(parent.CredentialsProtocol).CredentialsProtocol.default
local logger = require(parent.Loggers).Logger
local passkeyConstantsModule = require(authCommon.Common.PasskeyConstants)

local function _() --[[ line: 18 | named "getStartPreauthRegistrationUrl" ]]
	-- upvalues: url (ref)
	return string.format("%sv1/passkey/start-preauth-registration", url.AUTH_URL)
end

local function startPreauthPasskeyRegistration(p0, p1) --[[ line: 22 ]]
	-- upvalues: httpService (ref), url (ref), promiseModule (ref), passkeyConstantsModule (ref)
	return p0(string.format("%sv1/passkey/start-preauth-registration", url.AUTH_URL), "POST", { postBody = httpService:JSONEncode({ username = p1 }) }):andThen(function(p2) --[[ line: 27 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2[1])
	end, function(p3) --[[ line: 29 ]]
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p3) == "table" then httpService:JSONEncode(p3) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.START_STEP
		})
	end)
end

return function(p4, p5) --[[ line: 40 | named "attemptPreauthPasskeyRegistration" ]]
	-- upvalues: startPreauthPasskeyRegistration (ref), httpService (ref), passkeyConstantsModule (ref), userInputService (ref), base64Module (ref), default (ref), promiseModule (ref), logger (ref)
	return startPreauthPasskeyRegistration(p4, p5):andThen(function(p6) --[[ line: 41 ]]
		-- upvalues: httpService (copy), passkeyConstantsModule (copy), userInputService (copy), base64Module (copy), default (copy), promiseModule (copy), logger (copy)
		local creationOptions = httpService:JSONDecode(p6.creationOptions)
		local var8 = tonumber(creationOptions.publicKey.timeout)
		creationOptions.keyType = passkeyConstantsModule.PLATFORM
		creationOptions.deviceBoundOnly = true
		
		if userInputService:GetPlatform() ~= Enum.Platform.Android then
			creationOptions.publicKey.challenge = base64Module.FromUrlSafeBase64(creationOptions.publicKey.challenge)
			creationOptions.publicKey.user.id = base64Module.FromUrlSafeBase64(creationOptions.publicKey.user.id)
		end
		return default:registerCredentials(default.CredentialsTypes.FIDO2, httpService:JSONEncode(creationOptions), var8 / passkeyConstantsModule.PASSKEY_TIMEOUT_DURATION):andThen(function(p7) --[[ line: 60 ]]
			-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy), logger (copy), base64Module (copy), p6 (ref)
			local var9 = httpService:JSONDecode(p7)
			
			if var9 == nil or next(var9) == nil then
				return promiseModule.reject({
					body = "Null resultTable",
					name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
					source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_EMPTY_RESPONSE
				})
			elseif var9.errorCode == nil then
				var9.id = base64Module.ToUrlSafeBase64(var9.id)
				var9.rawId = base64Module.ToUrlSafeBase64(var9.rawId)
				var9.response.attestationObject = base64Module.ToUrlSafeBase64(var9.response.attestationObject)
				var9.response.clientDataJSON = base64Module.ToUrlSafeBase64(var9.response.clientDataJSON)
				
				return promiseModule.resolve({
					result = httpService:JSONEncode(var9),
					sessionId = p6.sessionId
				})
			end
			logger:warning("Passkey credential signing failed. Error {} ({}) returned.", var9.errorCode, var9.errorMsg)
			
			return promiseModule.reject({
				body = var9.errorMsg,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
			})
		end, function(p8) --[[ line: 88 ]]
			-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
			return promiseModule.reject({
				body = p8,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
			})
		end)
	end, function(p9) --[[ line: 95 ]]
		-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
		return if type(p9) == "table" and p9.name then promiseModule.reject(p9) else promiseModule.reject({
			body = p9,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.UNKNOWN_BACKEND_ERROR
		})
	end)
end