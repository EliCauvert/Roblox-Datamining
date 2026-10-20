local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("AccountSwitching").Parent.UrlBuilder).UrlBuilder
local PathsModule = require(script.Parent.Paths)

return function(Callback, Encrypted_users_data_blob, Remove_invalid_active_user)
	-- upvalues: UrlBuilder (copy), PathsModule (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString(PathsModule.GetAccountsListAsPreviousAccountEntries)(), "POST", {
		postBody = HttpService:JSONEncode({
			encrypted_users_data_blob = Encrypted_users_data_blob,
			remove_invalid_active_user = Remove_invalid_active_user
		})
	})
end