local CreateCategorySelectionStoreModule = require(script.Parent.GetCategorySelectionStore.createCategorySelectionStore)
local UseDoesCatalogCategoryExistModule = require(script.useDoesCatalogCategoryExist)
local RegisterSduiSelectionBridgeModule = require(script.registerSduiSelectionBridge)
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceServerDrivenUiModule = require(CorePackages.Workspace.Packages.AvatarExperienceServerDrivenUi)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagSduiMarketplaceCatalogActions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiMarketplaceCatalogActions
local v1 = require(script.createCatalogCategoriesStore)()
local CategorySelectionStoreModule = CreateCategorySelectionStoreModule(v1)
local CategorySelectionStoreModule1 = CreateCategorySelectionStoreModule(v1)

local function getCatalogSelectionStore()
	-- upvalues: CategorySelectionStoreModule (copy)
	return CategorySelectionStoreModule
end

return {
	getCatalogCategoriesStore = function()
		-- upvalues: v1 (copy)
		return v1
	end,
	getCatalogSelectionStore = getCatalogSelectionStore,
	getCatalogSearchSelectionStore = function()
		-- upvalues: CategorySelectionStoreModule1 (copy)
		return CategorySelectionStoreModule1
	end,
	useDoesCatalogCategoryExist = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then UseDoesCatalogCategoryExistModule else nil,
	resetSduiSelectionBridge = if FFlagSduiMarketplaceCatalogActions then RegisterSduiSelectionBridgeModule(AvatarExperienceServerDrivenUiModule.MarketplaceCatalogSduiSelectionBridge, getCatalogSelectionStore) else nil
}