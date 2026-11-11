local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, Pin)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(Pin) == "string", "invalid account PIN")
	
	return Callback(string.format("%sv1/account/pin/unlock", UrlModule.AUTH_URL), "POST", { postBody = HttpService:JSONEncode({ pin = Pin }) })
end