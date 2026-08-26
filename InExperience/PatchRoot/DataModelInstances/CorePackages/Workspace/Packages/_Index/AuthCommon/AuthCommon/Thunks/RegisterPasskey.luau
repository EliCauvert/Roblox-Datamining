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
local fFlagEmitPasskeyRegistrationSourceOnFinish = require(parent.SharedFlags).FFlagEmitPasskeyRegistrationSourceOnFinish

local function _()
	-- upvalues: url (ref)
	return string.format("%sv1/passkey/FinishRegistration", url.AUTH_URL)
end

local function finishPasskeyRegistration(p1, p2)
	-- upvalues: url (ref), promiseModule (ref), httpService (ref), passkeyConstantsModule (ref)
	return p1(string.format("%sv1/passkey/FinishRegistration", url.AUTH_URL), "POST", { postBody = p2 }):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p3)
	end, function(p3)
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p3) == "table" then httpService:JSONEncode(p3) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.FINISH_STEP
		})
	end)
end

local _ = function(p1)
	-- upvalues: url (ref)
	local formattedText = string.format("%sv1/passkey/StartRegistration", url.AUTH_URL)
	
	return if p1 then string.format("%s?flow=%s", formattedText, p1) else formattedText
end

local function startPasskeyRegistration(p1, p2, p3)
	-- upvalues: httpService (ref), url (ref), promiseModule (ref), passkeyConstantsModule (ref)
	local formattedText = string.format("%sv1/passkey/StartRegistration", url.AUTH_URL)
	
	return p1(if p2 then string.format("%s?flow=%s", formattedText, p2) else formattedText, "POST", {
		postBody = httpService:JSONEncode({ isSilentUpgrade = p3 })
	}, p3):andThen(function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p4[1])
	end, function(p4)
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p4) == "table" then httpService:JSONEncode(p4) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.START_STEP
		})
	end)
end

return function(p1, p2, p3, p4)
	-- upvalues: startPasskeyRegistration (ref), httpService (ref), userInputService (ref), base64Module (ref), default (ref), promiseModule (ref), passkeyConstantsModule (ref), logger (ref), fFlagEmitPasskeyRegistrationSourceOnFinish (ref), finishPasskeyRegistration (ref)
	return startPasskeyRegistration(p1, p2, p3):andThen(function(p5)
		-- upvalues: httpService (copy), p3 (ref), userInputService (copy), base64Module (copy), default (copy), promiseModule (copy), passkeyConstantsModule (copy), logger (copy), fFlagEmitPasskeyRegistrationSourceOnFinish (copy), p4 (ref), finishPasskeyRegistration (copy), p1 (ref)
		local creationOptions = httpService:JSONDecode(p5.creationOptions)
		local sessionId = p5.sessionId
		local var1 = tonumber(creationOptions.publicKey.timeout)
		creationOptions.keyType = "platform"
		creationOptions.deviceBoundOnly = true
		creationOptions.isSilentPasskeyUpgrade = p3
		
		if userInputService:GetPlatform() ~= Enum.Platform.Android then
			creationOptions.publicKey.challenge = base64Module.FromUrlSafeBase64(creationOptions.publicKey.challenge)
			creationOptions.publicKey.user.id = base64Module.FromUrlSafeBase64(creationOptions.publicKey.user.id)
		end
		return default:registerCredentials(default.CredentialsTypes.FIDO2, httpService:JSONEncode(creationOptions), var1 / 1000):andThen(function(p6)
			-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy), logger (copy), base64Module (copy), sessionId (ref), fFlagEmitPasskeyRegistrationSourceOnFinish (copy), p4 (copy), finishPasskeyRegistration (copy), p1 (copy)
			local var2 = httpService:JSONDecode(p6)
			
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
				
				return finishPasskeyRegistration(p1, httpService:JSONEncode({
					credentialNickname = "Passkey",
					sessionId = sessionId,
					attestationResponse = httpService:JSONEncode(var2),
					source = if fFlagEmitPasskeyRegistrationSourceOnFinish then p4 else nil
				}))
			end
			logger:warning("Passkey credential signing failed. Error {} ({}) returned.", var2.errorCode, var2.errorMsg)
			
			return promiseModule.reject({
				body = var2.errorMsg,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
			})
		end, function(p6)
			-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
			return promiseModule.reject({
				body = p6,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
			})
		end)
	end, function(p5)
		-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
		return if type(p5) == "table" and p5.name then promiseModule.reject(p5) else promiseModule.reject({
			body = p5,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.UNKNOWN_BACKEND_ERROR
		})
	end)
end