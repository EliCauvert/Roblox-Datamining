local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local GenericWebPageWrapperModule = require(Modules.LuaApp.Components.GenericWebPageWrapper)
local GetFStringBlackbirdUrlFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringBlackbirdUrl
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local GetSubscriptionPurchaseCloseCallback = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback

return function(ScreenGui)
	-- upvalues: ReactModule (copy), GetSubscriptionPurchaseCloseCallback (copy), GenericWebPageWrapperModule (copy), UrlBuilderModule (copy), GetFStringBlackbirdUrlFunction (copy)
	return ReactModule.createElement(GenericWebPageWrapperModule, {
		titleKey = "CommonUI.Features.Label.X",
		isVisible = ScreenGui.isVisible,
		DisplayOrder = ScreenGui.DisplayOrder,
		url = UrlBuilderModule.fromString(GetFStringBlackbirdUrlFunction())(),
		transitionAnimation = ScreenGui.transitionAnimation,
		onClose = ReactModule.useMemo(GetSubscriptionPurchaseCloseCallback, {})
	})
end