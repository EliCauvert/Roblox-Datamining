local httpService = game:GetService("HttpService")
local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local base64Module = require(authCommon.Utils.Base64)
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local passkeyConstantsModule = require(authCommon.Common.PasskeyConstants)
local fFlagEmitPasskeyRegistrationSourceOnFinish = require(parent.SharedFlags).FFlagEmitPasskeyRegistrationSourceOnFinish

local function _()
	-- upvalues: url (ref)
	return string.format("%sv1/passkey/finish-ar-preauth-registration", url.AUTH_URL)
end

local function finishARPreauthPasskeyRegistration(p1, p2)
	-- upvalues: url (ref), promiseModule (ref), httpService (ref), passkeyConstantsModule (ref)
	return p1(string.format("%sv1/passkey/finish-ar-preauth-registration", url.AUTH_URL), "POST", { postBody = p2 }):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p3)
	end, function(p3)
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p3) == "table" then httpService:JSONEncode(p3) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME
		})
	end)
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: httpService (ref), base64Module (ref), fFlagEmitPasskeyRegistrationSourceOnFinish (ref), finishARPreauthPasskeyRegistration (ref)
	local var1 = httpService:JSONDecode(p5)
	var1.id = base64Module.ToUrlSafeBase64(var1.id)
	var1.rawId = base64Module.ToUrlSafeBase64(var1.rawId)
	var1.response.attestationObject = base64Module.ToUrlSafeBase64(var1.response.attestationObject)
	var1.response.clientDataJSON = base64Module.ToUrlSafeBase64(var1.response.clientDataJSON)
	
	return finishARPreauthPasskeyRegistration(p1, httpService:JSONEncode({
		recoverySession = p2,
		passkeySessionId = p3,
		passkeyRegistrationResponse = httpService:JSONEncode(var1),
		userId = p4,
		isPostRecovery = p6,
		source = if fFlagEmitPasskeyRegistrationSourceOnFinish then p7 else nil
	}))
end