local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AddAnalyticsMetadataFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.AddAnalyticsMetadata
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local SendDetailedCatalogAnalyticsModule = require(Modules.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics)
local _ = require(Modules.AvatarExperience.Common.Types)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AnalyticsModule (copy), ReactModule (copy), AddAnalyticsMetadataFunction (copy), SendDetailedCatalogAnalyticsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local AnalyticsContext = p1.analyticsContext
	local ItemId = p1.itemId
	local ItemType = p1.itemType
	local Index = p1.index
	local AnalyticsItemCountPerPage = p1.analyticsItemCountPerPage
	
	return ReactModule.useCallback(function()
		-- upvalues: ItemId (copy), ItemType (copy), UseDispatchResult (copy), AddAnalyticsMetadataFunction (upval), Index (copy), SendDetailedCatalogAnalyticsModule (upval), AnalyticsContext (copy), UseRoactServiceResult (copy), AnalyticsItemCountPerPage (copy)
		if ItemId and ItemType then
			UseDispatchResult(AddAnalyticsMetadataFunction({ selectedItemIndex = Index }))
			UseDispatchResult(SendDetailedCatalogAnalyticsModule(AnalyticsContext, UseRoactServiceResult.clickCatalogItem, ItemId, ItemType, Index, AnalyticsItemCountPerPage, false))
			
			return
		end
	end, {
		UseDispatchResult, UseRoactServiceResult, AnalyticsContext, ItemId, ItemType,
		Index, AnalyticsItemCountPerPage
	})
end