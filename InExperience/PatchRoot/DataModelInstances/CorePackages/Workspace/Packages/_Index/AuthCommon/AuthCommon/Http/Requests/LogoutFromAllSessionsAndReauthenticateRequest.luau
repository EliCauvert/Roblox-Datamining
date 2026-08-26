local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p1(urlBuilder.fromString("auth:/v1/logoutfromallsessionsandreauthenticate")(), "POST", {
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