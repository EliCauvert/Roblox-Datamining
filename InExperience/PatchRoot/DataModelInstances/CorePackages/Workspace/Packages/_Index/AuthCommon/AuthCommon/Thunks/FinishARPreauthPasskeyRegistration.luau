local httpService = game:GetService("HttpService")
local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local base64Module = require(authCommon.Utils.Base64)
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local passkeyConstantsModule = require(authCommon.Common.PasskeyConstants)

local function _() --[[ line: 13 | named "getFinishRegistrationUrl" ]]
	-- upvalues: url (ref)
	return string.format("%sv1/passkey/finish-ar-preauth-registration", url.AUTH_URL)
end

local function finishARPreauthPasskeyRegistration(p0, p1) --[[ line: 17 ]]
	-- upvalues: url (ref), promiseModule (ref), httpService (ref), passkeyConstantsModule (ref)
	return p0(string.format("%sv1/passkey/finish-ar-preauth-registration", url.AUTH_URL), "POST", { postBody = p1 }):andThen(function(p2) --[[ line: 18 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2)
	end, function(p3) --[[ line: 20 ]]
		-- upvalues: httpService (copy), promiseModule (copy), passkeyConstantsModule (copy)
		return promiseModule.reject({
			body = if type(p3) == "table" then httpService:JSONEncode(p3) else nil,
			name = passkeyConstantsModule.BACKEND_CREATION_ERROR_NAME
		})
	end)
end

return function(p4, p5, p6, p7, p8, p9) --[[ line: 26 | named "attemptFinishARPreauthPasskeyRegistration" ]]
	-- upvalues: httpService (ref), base64Module (ref), finishARPreauthPasskeyRegistration (ref)
	local var6 = httpService:JSONDecode(p8)
	var6.id = base64Module.ToUrlSafeBase64(var6.id)
	var6.rawId = base64Module.ToUrlSafeBase64(var6.rawId)
	var6.response.attestationObject = base64Module.ToUrlSafeBase64(var6.response.attestationObject)
	var6.response.clientDataJSON = base64Module.ToUrlSafeBase64(var6.response.clientDataJSON)
	
	return finishARPreauthPasskeyRegistration(p4, httpService:JSONEncode({
		recoverySession = p5,
		passkeySessionId = p6,
		passkeyRegistrationResponse = httpService:JSONEncode(var6),
		userId = p7,
		isPostRecovery = p9
	}))
end