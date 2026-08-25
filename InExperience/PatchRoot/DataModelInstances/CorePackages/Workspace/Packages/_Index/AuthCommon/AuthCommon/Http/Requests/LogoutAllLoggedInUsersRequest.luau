local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0, p1)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("apis:account-switcher/v1/logoutAllLoggedInUsers")(), "POST", {
		postBody = httpService:JSONEncode({ encrypted_users_data_blob = p1 })
	})
end