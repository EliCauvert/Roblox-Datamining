local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sgame-passes/v1/universes/%s/game-passes?pageSize=50&passView=Full", UrlModule.APIS_URL, p1), "GET")
end