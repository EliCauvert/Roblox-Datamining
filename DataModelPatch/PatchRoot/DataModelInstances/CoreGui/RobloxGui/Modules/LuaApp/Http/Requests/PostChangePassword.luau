local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, CurrentPassword, NewPassword)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(CurrentPassword) == "string", "invalid current password")
	assert(type(NewPassword) == "string", "invalid new password")
	
	return Callback(string.format("%sv2/user/passwords/change", UrlModule.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({
			currentPassword = CurrentPassword,
			newPassword = NewPassword
		})
	})
end