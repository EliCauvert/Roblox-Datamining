local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("auth:/v1/logoutfromallsessionsandreauthenticate")(), "POST", {
		postBody = HttpService:JSONEncode({
			SecureAuthenticationIntent = {
				clientPublicKey = "",
				clientEpochTimestamp = "",
				saiSignature = "",
				serverNonce = ""
			}
		})
	})
end