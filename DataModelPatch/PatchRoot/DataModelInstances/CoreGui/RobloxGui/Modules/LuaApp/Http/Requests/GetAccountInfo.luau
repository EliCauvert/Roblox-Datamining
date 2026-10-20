local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%susers/account-info", UrlModule.API_URL), "GET", { maxRetryCount = 0 })
end