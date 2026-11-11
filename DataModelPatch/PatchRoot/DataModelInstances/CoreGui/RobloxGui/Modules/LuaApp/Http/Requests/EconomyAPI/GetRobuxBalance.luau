local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(("%s/v1/user/currency"):format(UrlModule.ECONOMY_URL), "GET")
end