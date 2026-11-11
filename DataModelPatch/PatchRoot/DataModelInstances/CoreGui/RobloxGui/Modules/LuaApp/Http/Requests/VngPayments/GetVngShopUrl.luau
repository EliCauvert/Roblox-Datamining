local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)

return function(Callback)
	-- upvalues: UrlBuilderModule (copy)
	return Callback(UrlBuilderModule.economy.vngPayments.getVngShopUrl(), "GET")
end