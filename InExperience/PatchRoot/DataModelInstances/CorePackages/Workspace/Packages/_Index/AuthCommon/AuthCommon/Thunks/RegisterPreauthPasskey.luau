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

local function _()
	-- upvalues: url (ref)
	return string.format("%sv1/passkey/start-preauth-registration", url.AUTH_URL)
end

local function startPreauthPasskeyRegistration(p1, p2)
	-- upvalues: httpService (ref), url (ref), promiseModule (ref), passkeyConstantsModule (ref)
	return p1(string.format("%sv1/passkey/start-preauth-registration", url.AUTH_URL), "POST", { postBody = httpService:JSONEncode({ username = p2 }) }):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p3[1])
	end, function(p3)
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p3) == "table" then httpService:JSONEncode(p3) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.START_STEP
		})
	end)
end

return function(p1, p2)
	-- upvalues: startPreauthPasskeyRegistration (ref), httpService (ref), passkeyConstantsModule (ref), userInputService (ref), base64Module (ref), default (ref), promiseModule (ref), logger (ref)
	return startPreauthPasskeyRegistration(p1, p2):andThen(function(p3)
		-- upvalues: httpService (copy), passkeyConstantsModule (copy), userInputService (copy), base64Module (copy), default (copy), promiseModule (copy), logger (copy)
		local creationOptions = httpService:JSONDecode(p3.creationOptions)
		local var1 = tonumber(creationOptions.publicKey.timeout)
		creationOptions.keyType = passkeyConstantsModule.PLATFORM
		creationOptions.deviceBoundOnly = true
		
		if userInputService:GetPlatform() ~= Enum.Platform.Android then
			creationOptions.publicKey.challenge = base64Module.FromUrlSafeBase64(creationOptions.publicKey.challenge)
			creationOptions.publicKey.user.id = base64Module.FromUrlSafeBase64(creationOptions.publicKey.user.id)
		end
		return default:registerCredentials(default.CredentialsTypes.FIDO2, httpService:JSONEncode(creationOptions), var1 / passkeyConstantsModule.PASSKEY_TIMEOUT_DURATION):andThen(function(p4)
			-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy), logger (copy), base64Module (copy), p3 (ref)
			local var2 = httpService:JSONDecode(p4)
			
			if var2 == nil or next(var2) == nil then
				return promiseModule.reject({
					body = "Null resultTable",
					name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
					source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_EMPTY_RESPONSE
				})
			elseif var2.errorCode == nil then
				var2.id = base64Module.ToUrlSafeBase64(var2.id)
				var2.rawId = base64Module.ToUrlSafeBase64(var2.rawId)
				var2.response.attestationObject = base64Module.ToUrlSafeBase64(var2.response.attestationObject)
				var2.response.clientDataJSON = base64Module.ToUrlSafeBase64(var2.response.clientDataJSON)
				
				return promiseModule.resolve({
					result = httpService:JSONEncode(var2),
					sessionId = p3.sessionId
				})
			end
			logger:warning("Passkey credential signing failed. Error {} ({}) returned.", var2.errorCode, var2.errorMsg)
			
			return promiseModule.reject({
				body = var2.errorMsg,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
			})
		end, function(p4)
			-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
			return promiseModule.reject({
				body = p4,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
			})
		end)
	end, function(p3)
		-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
		return if type(p3) == "table" and p3.name then promiseModule.reject(p3) else promiseModule.reject({
			body = p3,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.UNKNOWN_BACKEND_ERROR
		})
	end)
end