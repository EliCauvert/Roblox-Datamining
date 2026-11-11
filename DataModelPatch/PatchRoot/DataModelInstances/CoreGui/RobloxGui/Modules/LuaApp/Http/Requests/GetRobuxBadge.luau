local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/robuxbadge/v1/robuxbadge", UrlModule.APIS_URL), "GET")
end