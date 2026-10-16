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

local function _(): string --[[ Line: 18 | Named "getStartPreauthRegistrationUrl" ]]
	-- upvalues: Url (copy)
	return string.format("%sv1/passkey/start-preauth-registration", Url.AUTH_URL)
end

local function startPreauthPasskeyRegistration(Callback, Username) --[[ Line: 22 ]]
	-- upvalues: HttpService (copy), Url (copy), PromiseModule (copy), PasskeyConstantsModule (copy)
	return Callback(string.format("%sv1/passkey/start-preauth-registration", Url.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({ username = Username })
	}):andThen(function(Entry) --[[ Line: 27 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Entry[1])
	end, function(Input) --[[ Line: 29 ]]
		-- upvalues: HttpService (upval), PromiseModule (upval), PasskeyConstantsModule (upval)
		return PromiseModule.reject({
			body = if type(Input) == "table" then HttpService:JSONEncode(Input) else nil,
			name = PasskeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = PasskeyConstantsModule.START_STEP
		})
	end)
end

return function(p1, Username) --[[ Line: 40 | Named "attemptPreauthPasskeyRegistration" ]]
	-- upvalues: startPreauthPasskeyRegistration (copy), HttpService (copy), PasskeyConstantsModule (copy), UserInputService (copy), Base64Module (copy), Default (copy), PromiseModule (copy), Logger (copy)
	return startPreauthPasskeyRegistration(p1, Username):andThen(function(Result) --[[ Line: 41 ]]
		-- upvalues: HttpService (upval), PasskeyConstantsModule (upval), UserInputService (upval), Base64Module (upval), Default (upval), PromiseModule (upval), Logger (upval)
		local Data = HttpService:JSONDecode(Result.creationOptions)
		local Number: number? = tonumber(Data.publicKey.timeout)
		Data.keyType = PasskeyConstantsModule.PLATFORM
		Data.deviceBoundOnly = true
		
		if UserInputService:GetPlatform() ~= Enum.Platform.Android then
			Data.publicKey.challenge = Base64Module.FromUrlSafeBase64(Data.publicKey.challenge)
			Data.publicKey.user.id = Base64Module.FromUrlSafeBase64(Data.publicKey.user.id)
		end
		return Default:registerCredentials(Default.CredentialsTypes.FIDO2, HttpService:JSONEncode(Data), Number / PasskeyConstantsModule.PASSKEY_TIMEOUT_DURATION):andThen(function(Result1) --[[ Line: 60 ]]
			-- upvalues: HttpService (upval), PromiseModule (upval), PasskeyConstantsModule (upval), Logger (upval), Base64Module (upval), Result (copy)
			local Data = HttpService:JSONDecode(Result1)
			
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
				
				return PromiseModule.resolve({
					result = HttpService:JSONEncode(Data),
					sessionId = Result.sessionId
				})
			else
				Logger:warning("Passkey credential signing failed. Error {} ({}) returned.", Data.errorCode, Data.errorMsg)
				
				return PromiseModule.reject({
					body = Data.errorMsg,
					name = PasskeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
					source = PasskeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
				})
			end
		end, function(Body) --[[ Line: 88 ]]
			-- upvalues: PromiseModule (upval), PasskeyConstantsModule (upval)
			return PromiseModule.reject({
				body = Body,
				name = PasskeyConstantsModule.USER_OS_DIALOG_ERROR_NAME,
				source = PasskeyConstantsModule.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
			})
		end)
	end, function(Body) --[[ Line: 95 ]]
		-- upvalues: PromiseModule (upval), PasskeyConstantsModule (upval)
		return if type(Body) == "table" and Body.name then PromiseModule.reject(Body) else PromiseModule.reject({
			body = Body,
			name = PasskeyConstantsModule.BACKEND_CREATION_ERROR_NAME,
			source = PasskeyConstantsModule.UNKNOWN_BACKEND_ERROR
		})
	end)
end