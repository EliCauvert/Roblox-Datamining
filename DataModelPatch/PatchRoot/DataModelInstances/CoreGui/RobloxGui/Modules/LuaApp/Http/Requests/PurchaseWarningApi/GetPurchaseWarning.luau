local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Http)
local GetFFlagUADesktopPurchaseWarningsModule = require(Modules.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings)

return function(Callback, p1, p2, Enabled)
	-- upvalues: GetFFlagUADesktopPurchaseWarningsModule (copy), UrlBuilderModule (copy)
	return Callback(if GetFFlagUADesktopPurchaseWarningsModule() then UrlBuilderModule.economy.purchaseWarning.getPurchaseWarning(p1, p2, Enabled == false) else UrlBuilderModule.economy.purchaseWarning.getPurchaseWarning(p1), "GET")
end