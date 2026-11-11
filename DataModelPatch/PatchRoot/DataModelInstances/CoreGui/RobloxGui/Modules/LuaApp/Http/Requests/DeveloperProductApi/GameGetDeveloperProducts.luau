local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sdeveloper-products/v1/universes/%s/store?page=1&pageSize=100&storePageEnabled=true", UrlModule.APIS_URL, p1), "GET")
end