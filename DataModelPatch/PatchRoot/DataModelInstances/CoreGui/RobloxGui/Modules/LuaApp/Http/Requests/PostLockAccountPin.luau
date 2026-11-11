local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sv1/account/pin/lock", UrlModule.AUTH_URL), "POST", { postBody = "" })
end