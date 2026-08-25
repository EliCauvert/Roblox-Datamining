local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("auth:/v1/logoutfromallsessionsandreauthenticate")(), "POST", {
		postBody = httpService:JSONEncode({
			SecureAuthenticationIntent = {
				clientPublicKey = "",
				clientEpochTimestamp = "",
				saiSignature = "",
				serverNonce = ""
			}
		})
	})
end