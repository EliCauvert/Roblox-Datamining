local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AuthCommon").Parent.UrlBuilder).UrlBuilder

return function(Callback, Encrypted_users_data_blob)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:account-switcher/v1/getLoggedInUsersMetadata")(), "POST", {
		postBody = HttpService:JSONEncode({
			remove_invalid_active_user = false,
			encrypted_users_data_blob = Encrypted_users_data_blob
		})
	})
end