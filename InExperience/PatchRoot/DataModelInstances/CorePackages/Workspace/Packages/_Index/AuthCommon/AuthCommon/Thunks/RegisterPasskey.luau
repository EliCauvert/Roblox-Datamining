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

local function _() --[[ line: 18 | named "getFinishRegistrationUrl" ]]
	-- upvalues: url (ref)
	return string.format("%sv1/passkey/FinishRegistration", url.AUTH_URL)
end

local function finishPasskeyRegistration(p0, p1) --[[ line: 22 ]]
	-- upvalues: url (ref), promiseModule (ref), httpService (ref), passkeyConstantsModule (ref)
	return p0(string.format("%sv1/passkey/FinishRegistration", url.AUTH_URL), "POST", { postBody = p1 }):andThen(function(p2) --[[ line: 23 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2)
	end, function(p3) --[[ line: 25 ]]
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p3) == "table" then httpService:JSONEncode(p3) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.FINISH_STEP
		})
	end)
end

local _ = function(p4) --[[ line: 36 | named "getStartRegistrationUrl" ]]
	-- upvalues: url (ref)
	local formattedText = string.format("%sv1/passkey/StartRegistration", url.AUTH_URL)
	
	return if p4 then string.format("%s?flow=%s", formattedText, p4) else formattedText
end

local function startPasskeyRegistration(p5, p6, p7) --[[ line: 52 ]]
	-- upvalues: httpService (ref), url (ref), promiseModule (ref), passkeyConstantsModule (ref)
	local formattedText = string.format("%sv1/passkey/StartRegistration", url.AUTH_URL)
	
	return p5(if p6 then string.format("%s?flow=%s", formattedText, p6) else formattedText, "POST", {
		postBody = httpService:JSONEncode({ isSilentUpgrade = p7 })
	}, p7):andThen(function(p8) --[[ line: 60 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p8[1])
	end, function(p9) --[[ line: 63 ]]
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p9) == "table" then httpService:JSONEncode(p9) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.START_STEP
		})
	end)
end

return function(p10, p11, p12, p13) --[[ line: 75 | named "attemptPasskeyRegistration" ]]
	-- upvalues: startPasskeyRegistration (ref), httpService (ref), userInputService (ref), base64Module (ref), default (ref), promiseModule (ref), passkeyConstantsModule (ref), logger (ref), fFlagEmitPasskeyRegistrationSourceOnFinish (ref), finishPasskeyRegistration (ref)
	return startPasskeyRegistration(p10, p11, p12):andThen(function(p14) --[[ line: 76 ]]
		-- upvalues: httpService (copy), p12 (ref), userInputService (copy), base64Module (copy), default (copy), promiseModule (copy), passkeyConstantsModule (copy), logger (copy), fFlagEmitPasskeyRegistrationSourceOnFinish (copy), p13 (ref), finishPasskeyRegistration (copy), p10 (ref)
		local creationOptions = httpService:JSONDecode(p14.creationOptions)
		local sessionId = p14.sessionId
		local var11 = tonumber(creationOptions.publicKey.timeout)
		creationOptions.keyType = "platform"
		creationOptions.deviceBoundOnly = true
		creationOptions.isSilentPasskeyUpgrade = p12
		
		if userInputService:GetPlatform() ~= Enum.Platform.Android then
			creationOptions.publicKey.challenge = base64Module.FromUrlSafeBase64(creationOptions.publicKey.challenge)
			creationOptions.publicKey.user.id = base64Module.FromUrlSafeBase64(creationOptions.publicKey.user.id)
		end
		return default:registerCredentials(default.CredentialsTypes.FIDO2, httpService:JSONEncode(creationOptions), var11 / 1000):andThen(function(p15) --[[ line: 95 ]]
			-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy), logger (copy), base64Module (copy), sessionId (ref), fFlagEmitPasskeyRegistrationSourceOnFinish (copy), p13 (copy), finishPasskeyRegistration (copy), p10 (copy)
			local var12 = httpService:JSONDecode(p15)
			
			if var12 == nil or next(var12) == nil then
				return promiseModule.reject({
					body = "Null resultTable",
					name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
					source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_EMPTY_RESPONSE
				})
			elseif var12.errorCode == nil then
				var12.id = base64Module.ToUrlSafeBase64(var12.id)
				var12.rawId = base64Module.ToUrlSafeBase64(var12.rawId)
				var12.response.attestationObject = base64Module.ToUrlSafeBase64(var12.response.attestationObject)
				var12.response.clientDataJSON = base64Module.ToUrlSafeBase64(var12.response.clientDataJSON)
				
				return finishPasskeyRegistration(p10, httpService:JSONEncode({
					credentialNickname = "Passkey",
					sessionId = sessionId,
					attestationResponse = httpService:JSONEncode(var12),
					source = if fFlagEmitPasskeyRegistrationSourceOnFinish then p13 else nil
				}))
			end
			logger:warning("Passkey credential signing failed. Error {} ({}) returned.", var12.errorCode, var12.errorMsg)
			
			return promiseModule.reject({
				body = var12.errorMsg,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
			})
		end, function(p16) --[[ line: 131 ]]
			-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
			return promiseModule.reject({
				body = p16,
				name = passkeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = passkeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
			})
		end)
	end, function(p17) --[[ line: 138 ]]
		-- upvalues: promiseModule (copy), passkeyConstantsModule (copy)
		return if type(p17) == "table" and p17.name then promiseModule.reject(p17) else promiseModule.reject({
			body = p17,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = passkeyConstantsModule.UNKNOWN_BACKEND_ERROR
		})
	end)
end