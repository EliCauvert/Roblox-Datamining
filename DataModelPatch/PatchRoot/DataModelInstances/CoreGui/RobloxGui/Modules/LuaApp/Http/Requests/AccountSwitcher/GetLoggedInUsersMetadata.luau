local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)

return function(Callback, Encrypted_users_data_blob, Remove_invalid_active_user)
	-- upvalues: UrlBuilderModule (copy), HttpService (copy)
	return Callback(UrlBuilderModule.fromString("apis:account-switcher/v1/getLoggedInUsersMetadata")(), "POST", {
		postBody = HttpService:JSONEncode({
			encrypted_users_data_blob = Encrypted_users_data_blob,
			remove_invalid_active_user = Remove_invalid_active_user
		})
	})
end