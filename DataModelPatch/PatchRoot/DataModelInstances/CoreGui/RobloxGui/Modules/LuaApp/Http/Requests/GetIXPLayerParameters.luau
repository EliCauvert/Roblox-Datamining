local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1, List)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sproduct-experimentation-platform/v1/projects/1/layers/%s/values?parameters=%s", UrlModule.APIS_URL, p1, table.concat(List, ",")), "GET", { maxRetryCount = 0 })
end