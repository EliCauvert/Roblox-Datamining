local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)

return function(Callback, Switched_to_user_id, Encrypted_users_data_blob, Switched_from_user_id)
	-- upvalues: UrlBuilderModule (copy), HttpService (copy)
	return Callback(UrlBuilderModule.fromString("apis:account-switcher/v1/switch")(), "POST", {
		postBody = HttpService:JSONEncode({
			switched_to_user_id = Switched_to_user_id,
			switched_from_user_id = Switched_from_user_id,
			encrypted_users_data_blob = Encrypted_users_data_blob
		})
	})
end