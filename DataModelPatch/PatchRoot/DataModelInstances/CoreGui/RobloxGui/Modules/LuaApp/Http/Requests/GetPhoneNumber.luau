local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)

return function(Callback)
	-- upvalues: UrlBuilderModule (copy)
	return Callback(UrlBuilderModule.fromString("accountinformation:phone")(), "GET")
end