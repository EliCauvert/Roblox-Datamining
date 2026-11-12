local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local BuildOrderedWidgetsFromCatalogPageModule = require(AvatarExperienceCatalog.Sdui.buildOrderedWidgetsFromCatalogPage)
local CollectDedupedHydrationContentModule = require(AvatarExperienceCatalog.Sdui.Utils.collectDedupedHydrationContent)
local GetCatalogConfigKeyModule = require(AvatarExperienceCatalog.Sdui.Utils.getCatalogConfigKey)
local GetCatalogPageIdentifierModule = require(AvatarExperienceCatalog.Sdui.Utils.getCatalogPageIdentifier)
local GetAXMarketplaceWidgetStoreModule = require(AvatarExperienceCatalog.Stores.GetAXMarketplaceWidgetStore)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1, p2, p3)
	-- upvalues: GetAXMarketplaceWidgetStoreModule (copy), BuildOrderedWidgetsFromCatalogPageModule (copy), GetCatalogConfigKeyModule (copy), GetCatalogPageIdentifierModule (copy), CollectDedupedHydrationContentModule (copy)
	local t = {}
	local t1 = {}
	local Count = 0
	
	for _, value in BuildOrderedWidgetsFromCatalogPageModule(GetCatalogConfigKeyModule(p1, (GetAXMarketplaceWidgetStoreModule(false).getDebouncedScreenSize(false))), GetCatalogPageIdentifierModule(p1)) do
		if p2 <= Count then break end
		if #value.content ~= 0 then
			CollectDedupedHydrationContentModule(value.content, t, t1, p3)
			Count += 1
		end
	end
	return t
end