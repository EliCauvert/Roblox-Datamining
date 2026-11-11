local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, Location)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(Location) == "string", "PostRegisterAppPresence request expects locationId to be a string")
	
	return Callback(string.format("%s/presence/register-app-presence", UrlModule.PRESENCE_URL), "POST", {
		postBody = HttpService:JSONEncode({ location = Location })
	})
end