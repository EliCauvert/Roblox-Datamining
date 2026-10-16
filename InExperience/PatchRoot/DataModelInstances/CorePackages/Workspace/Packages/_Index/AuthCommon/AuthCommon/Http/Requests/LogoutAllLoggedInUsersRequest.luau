local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback, Encrypted_users_data_blob) --[[ Line: 8 ]]
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:account-switcher/v1/logoutAllLoggedInUsers")(), "POST", {
		postBody = HttpService:JSONEncode({ encrypted_users_data_blob = Encrypted_users_data_blob })
	})
end