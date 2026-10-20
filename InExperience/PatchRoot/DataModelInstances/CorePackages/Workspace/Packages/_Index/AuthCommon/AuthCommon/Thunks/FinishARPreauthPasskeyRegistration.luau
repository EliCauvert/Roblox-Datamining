local HttpService = game:GetService("HttpService")
local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local Base64Module = require(AuthCommon.Utils.Base64)
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local PasskeyConstantsModule = require(AuthCommon.Common.PasskeyConstants)
local FFlagEmitPasskeyRegistrationSourceOnFinish = require(Parent.SharedFlags).FFlagEmitPasskeyRegistrationSourceOnFinish

local function _(): string
	-- upvalues: Url (copy)
	return string.format("%sv1/passkey/finish-ar-preauth-registration", Url.AUTH_URL)
end

local function finishARPreauthPasskeyRegistration(Callback, PostBody)
	-- upvalues: Url (copy), PromiseModule (copy), HttpService (copy), PasskeyConstantsModule (copy)
	return Callback(string.format("%sv1/passkey/finish-ar-preauth-registration", Url.AUTH_URL), "POST", { postBody = PostBody }):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end, function(Input)
		-- upvalues: HttpService (upval), PromiseModule (upval), PasskeyConstantsModule (upval)
		return PromiseModule.reject({
			body = if type(Input) == "table" then HttpService:JSONEncode(Input) else nil,
			name = PasskeyConstantsModule.BACKEND_CREATION_ERROR_NAME
		})
	end)
end

return function(p1, RecoverySession, PasskeySessionId, UserId, Input, IsPostRecovery, p2)
	-- upvalues: HttpService (copy), Base64Module (copy), FFlagEmitPasskeyRegistrationSourceOnFinish (copy), finishARPreauthPasskeyRegistration (copy)
	local Data = HttpService:JSONDecode(Input)
	Data.id = Base64Module.ToUrlSafeBase64(Data.id)
	Data.rawId = Base64Module.ToUrlSafeBase64(Data.rawId)
	Data.response.attestationObject = Base64Module.ToUrlSafeBase64(Data.response.attestationObject)
	Data.response.clientDataJSON = Base64Module.ToUrlSafeBase64(Data.response.clientDataJSON)
	
	return finishARPreauthPasskeyRegistration(p1, (HttpService:JSONEncode({
		recoverySession = RecoverySession,
		passkeySessionId = PasskeySessionId,
		passkeyRegistrationResponse = HttpService:JSONEncode(Data),
		userId = UserId,
		isPostRecovery = IsPostRecovery,
		source = if FFlagEmitPasskeyRegistrationSourceOnFinish then p2 else nil
	})))
end