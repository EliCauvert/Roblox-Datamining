local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)

return function(Callback, Acknowledgement)
	-- upvalues: UrlBuilderModule (copy), HttpService (copy)
	return Callback(UrlBuilderModule.economy.purchaseWarning.ackPurchaseWarning(), "POST", {
		postBody = HttpService:JSONEncode({ acknowledgement = Acknowledgement })
	})
end