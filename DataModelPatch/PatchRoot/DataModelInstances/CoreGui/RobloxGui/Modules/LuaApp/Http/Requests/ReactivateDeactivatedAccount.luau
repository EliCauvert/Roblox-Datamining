local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(UrlModule.APIS_URL .. "account-deletion-api/v1/reactivate", "POST")
end