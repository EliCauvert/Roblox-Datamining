local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AppPageModule = require(Modules.LuaApp.AppPage)
local _ = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images

return {
	tabs = require(Modules.LuaApp.Components.AppNav.GetIABottomBarItems)(),
	options = {
		{
			titleLocalizationKey = "Feature.Catalog.Label.Search",
			actionType = nil,
			page = AppPageModule.SearchPage,
			icon = Images["icons/common/search"]
		},
		{
			titleLocalizationKey = "Feature.Home.Robux",
			actionType = nil,
			page = AppPageModule.PurchaseRobux,
			icon = Images["icons/common/goldrobux"]
		},
		{
			titleLocalizationKey = "CommonUI.Features.Label.More",
			actionType = nil,
			page = AppPageModule.More,
			icon = Images["icons/common/more"]
		}
	}
}