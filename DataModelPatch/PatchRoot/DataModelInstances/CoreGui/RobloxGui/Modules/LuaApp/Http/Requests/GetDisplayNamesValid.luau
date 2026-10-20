local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "display-names/validate",
	query = "displayname={displayname}&birthdate={birthday}",
	base = require(Modules.LuaApp.Http.Url).USERS_URL
})

return function(Callback, Displayname, Birthday)
	-- upvalues: NewResult (copy)
	return Callback(NewResult({ displayname = Displayname, birthday = Birthday }), "GET", { maxRetryCount = 0 })
end