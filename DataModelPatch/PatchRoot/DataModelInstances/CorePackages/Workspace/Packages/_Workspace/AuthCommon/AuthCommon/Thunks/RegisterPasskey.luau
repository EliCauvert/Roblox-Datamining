local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local Base64Module = require(AuthCommon.Utils.Base64)
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local Default = require(Parent.CredentialsProtocol).CredentialsProtocol.default
local Logger = require(Parent.Loggers).Logger
local PasskeyConstantsModule = require(AuthCommon.Common.PasskeyConstants)

local function _(): string
	-- upvalues: Url (copy)
	return string.format("%sv1/passkey/FinishRegistration", Url.AUTH_URL)
end

local function finishPasskeyRegistration(Callback, PostBody)
	-- upvalues: Url (copy), PromiseModule (copy), HttpService (copy), PasskeyConstantsModule (copy)
	return Callback(string.format("%sv1/passkey/FinishRegistration", Url.AUTH_URL), "POST", { postBody = PostBody }):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end, function(Input)
		-- upvalues: HttpService (upval), PromiseModule (upval), PasskeyConstantsModule (upval)
		return PromiseModule.reject({
			body = if type(Input) == "table" then HttpService:JSONEncode(Input) else nil,
			name = PasskeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = PasskeyConstantsModule.FINISH_STEP
		})
	end)
end

local _ = function(p1): string
	-- upvalues: Url (copy)
	local Formatted = string.format("%sv1/passkey/StartRegistration", Url.AUTH_URL)
	
	return if p1 then string.format("%s?flow=%s", Formatted, p1) else Formatted
end

local function startPasskeyRegistration(Callback, p1, IsSilentUpgrade)
	-- upvalues: HttpService (copy), Url (copy), PromiseModule (copy), PasskeyConstantsModule (copy)
	local Formatted = string.format("%sv1/passkey/StartRegistration", Url.AUTH_URL)
	
	return Callback(if p1 then string.format("%s?flow=%s", Formatted, p1) else Formatted, "POST", {
		postBody = HttpService:JSONEncode({ isSilentUpgrade = IsSilentUpgrade })
	}, IsSilentUpgrade):andThen(function(Entry)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Entry[1])
	end, function(Input)
		-- upvalues: HttpService (upval), PromiseModule (upval), PasskeyConstantsModule (upval)
		return PromiseModule.reject({
			body = if type(Input) == "table" then HttpService:JSONEncode(Input) else nil,
			name = PasskeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = PasskeyConstantsModule.START_STEP
		})
	end)
end

return function(p1, p2, IsSilentPasskeyUpgrade)
	-- upvalues: startPasskeyRegistration (copy), HttpService (copy), UserInputService (copy), Base64Module (copy), Default (copy), PromiseModule (copy), PasskeyConstantsModule (copy), Logger (copy), finishPasskeyRegistration (copy)
	return startPasskeyRegistration(p1, p2, IsSilentPasskeyUpgrade):andThen(function(Result)
		-- upvalues: HttpService (upval), IsSilentPasskeyUpgrade (copy), UserInputService (upval), Base64Module (upval), Default (upval), PromiseModule (upval), PasskeyConstantsModule (upval), Logger (upval), finishPasskeyRegistration (upval), p1 (copy)
		local Data = HttpService:JSONDecode(Result.creationOptions)
		local SessionId = Result.sessionId
		local Number: number? = tonumber(Data.publicKey.timeout)
		Data.keyType = "platform"
		Data.deviceBoundOnly = true
		Data.isSilentPasskeyUpgrade = IsSilentPasskeyUpgrade
		
		if UserInputService:GetPlatform() ~= Enum.Platform.Android then
			Data.publicKey.challenge = Base64Module.FromUrlSafeBase64(Data.publicKey.challenge)
			Data.publicKey.user.id = Base64Module.FromUrlSafeBase64(Data.publicKey.user.id)
		end
		return Default:registerCredentials(Default.CredentialsTypes.FIDO2, HttpService:JSONEncode(Data), Number / 1000):andThen(function(Result)
			-- upvalues: HttpService (upval), PromiseModule (upval), PasskeyConstantsModule (upval), Logger (upval), Base64Module (upval), SessionId (copy), finishPasskeyRegistration (upval), p1 (upval)
			local Data = HttpService:JSONDecode(Result)
			
			if Data == nil or next(Data) == nil then
				return PromiseModule.reject({
					body = "Null resultTable",
					name = PasskeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
					source = PasskeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_EMPTY_RESPONSE
				})
			elseif Data.errorCode == nil then
				Data.id = Base64Module.ToUrlSafeBase64(Data.id)
				Data.rawId = Base64Module.ToUrlSafeBase64(Data.rawId)
				Data.response.attestationObject = Base64Module.ToUrlSafeBase64(Data.response.attestationObject)
				Data.response.clientDataJSON = Base64Module.ToUrlSafeBase64(Data.response.clientDataJSON)
				
				return finishPasskeyRegistration(p1, (HttpService:JSONEncode({
					credentialNickname = "Passkey",
					sessionId = SessionId,
					attestationResponse = HttpService:JSONEncode(Data)
				})))
			else
				Logger:warning("Passkey credential signing failed. Error {} ({}) returned.", Data.errorCode, Data.errorMsg)
				
				return PromiseModule.reject({
					body = Data.errorMsg,
					name = PasskeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
					source = PasskeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
				})
			end
		end, function(Body)
			-- upvalues: PromiseModule (upval), PasskeyConstantsModule (upval)
			return PromiseModule.reject({
				body = Body,
				name = PasskeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = PasskeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
			})
		end)
	end, function(Body)
		-- upvalues: PromiseModule (upval), PasskeyConstantsModule (upval)
		return if type(Body) == "table" and Body.name then PromiseModule.reject(Body) else PromiseModule.reject({
			body = Body,
			name = PasskeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = PasskeyConstantsModule.UNKNOWN_BACKEND_ERROR
		})
	end)
end