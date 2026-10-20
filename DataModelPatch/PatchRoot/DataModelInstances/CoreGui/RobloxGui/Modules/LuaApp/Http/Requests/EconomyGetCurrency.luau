local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	assert(type(p1) == "string", "EconomyGetCurrency request expects userId to be a string")
	
	return Callback(string.format("%s/v1/users/%s/currency", UrlModule.ECONOMY_URL, p1), "GET")
end