local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(UrlModule.APIS_URL .. "identity-verification-service/v1/vietnam/validate-verification-form-status", "POST")
end