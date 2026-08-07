local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("apis:account-switcher/v1/getLoggedInUsersMetadata")(), "POST", {
		postBody = httpService:JSONEncode({
			remove_invalid_active_user = false,
			encrypted_users_data_blob = p1
		})
	})
end