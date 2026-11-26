local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local Base64Module = require(AuthCommon.Utils.Base64)
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local CredentialsProtocolErrorCodes = CredentialsProtocolModule.CredentialsProtocolErrorCodes
local CREDENTIALSPROTOCOLGETCREDENTIALSDEFAULTTIMEOUT = CredentialsProtocolModule.Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT

local function parseCredentialsResult(SessionId, Input)
	-- upvalues: HttpService (copy), CredentialsProtocolErrorCodes (copy), Base64Module (copy)
	if Input == nil then
		return { status = "noCredential" }
	end
	local Data = HttpService:JSONDecode(Input)
	
	if Data == nil or next(Data) == nil then
		return { status = "noCredential" }
	end
	if Data.errorCode ~= nil then
		local GetCredentialsErrorCode = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[tonumber(Data.errorCode) or -1] or string.format(CredentialsProtocolErrorCodes.UNMAPPED_ERROR_CODE, (tostring(Data.errorCode)))
		
		return {
			status = "credentialError",
			errorCode = tostring(Data.errorCode),
			errorMsg = if type(Data.errorMsg) == "string" then Data.errorMsg else nil,
			errorName = GetCredentialsErrorCode,
			cancelled = GetCredentialsErrorCode == "CANCELLATION_ERROR"
		}
	end
	Data.id = Base64Module.ToUrlSafeBase64(Data.id)
	Data.rawId = Base64Module.ToUrlSafeBase64(Data.rawId)
	Data.response.signature = Base64Module.ToUrlSafeBase64(Data.response.signature)
	
	if Data.response.userHandle ~= nil then
		Data.response.userHandle = Base64Module.ToUrlSafeBase64(Data.response.userHandle)
	end
	Data.response.authenticatorData = Base64Module.ToUrlSafeBase64(Data.response.authenticatorData)
	Data.response.clientDataJSON = Base64Module.ToUrlSafeBase64(Data.response.clientDataJSON)
	
	return {
		status = "asserted",
		sessionId = SessionId,
		credential = Data
	}
end

return function(p1)
	-- upvalues: CredentialsProtocolModule (copy), UserInputService (copy), PromiseModule (copy), HttpService (copy), CREDENTIALSPROTOCOLGETCREDENTIALSDEFAULTTIMEOUT (copy), Base64Module (copy), parseCredentialsResult (copy)
	local CredentialsProtocol = p1.credentialsProtocol or CredentialsProtocolModule.CredentialsProtocol.default
	local Platform = p1.platform or UserInputService:GetPlatform()
	
	return PromiseModule.new(function(Callback: (any) -> ())
		-- upvalues: p1 (copy), HttpService (upval), CREDENTIALSPROTOCOLGETCREDENTIALSDEFAULTTIMEOUT (upval), Platform (copy), Base64Module (upval), CredentialsProtocol (copy), parseCredentialsResult (upval)
		local function _(p2)
			-- upvalues: Callback (copy)
			Callback(p2)
		end
		
		local Success, Result, Result3 = pcall(function()
			-- upvalues: p1 (upval)
			return p1.startAuthentication():await()
		end)
		
		if not Success then
			Callback({ status = "startFailed" })
			
			return
		end
		if not Result then
			Callback({
				status = "startFailed",
				errorCode = if typeof(Result3) == "table" then Result3.errorCode else nil
			})
			
			return
		end
		local SessionId = if typeof(Result3) == "table" then Result3.sessionId else nil
		
		if typeof(SessionId) ~= "string" or SessionId == "" then
			Callback({ status = "startFailed" })
			
			return
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result3 (copy), CREDENTIALSPROTOCOLGETCREDENTIALSDEFAULTTIMEOUT (upval), p1 (upval), Platform (upval), Base64Module (upval), CredentialsProtocol (upval), parseCredentialsResult (upval), SessionId (copy), Callback (copy)
			local Data = HttpService:JSONDecode(Result3.authenticationOptions)
			local Number: number? = tonumber(Data.publicKey.timeout)
			local NumberRatio = if Number then Number / 1000 else CREDENTIALSPROTOCOLGETCREDENTIALSDEFAULTTIMEOUT
			Data.keyType = "platform"
			Data.deviceBoundOnly = p1.deviceBoundOnly
			
			if Platform ~= Enum.Platform.Android then
				local PublicKey = Data.publicKey
				PublicKey.challenge = Base64Module.FromUrlSafeBase64(PublicKey.challenge)
				
				if PublicKey.allowCredentials then
					for _, allowCredential in ipairs(PublicKey.allowCredentials) do
						allowCredential.id = Base64Module.FromUrlSafeBase64(allowCredential.id)
					end
				end
			end
			local v1, v2 = CredentialsProtocol:getCredentials(CredentialsProtocol.CredentialsTypes.FIDO2, HttpService:JSONEncode(Data), NumberRatio):await()
			
			if v1 then
				Callback((parseCredentialsResult(SessionId, v2)))
				
				return
			else
				Callback({ status = "failed", error = v2 })
			end
		end)
		
		if not Success1 then
			Callback({ status = "failed", error = Result1 })
		end
	end)
end