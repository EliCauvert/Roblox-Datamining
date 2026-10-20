local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local PillGroup = require(CorePackages.Packages.UIBlox).App.Control.PillGroup
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseCatalogTopicsModule = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogTopics)
local UseSelectedTopicsModule = require(Modules.AvatarExperience.Catalog.Hooks.useSelectedTopics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local FilterButtonLayoutModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateToSearchModule = require(Modules.AvatarExperience.Catalog.Thunks.NavigateToSearch)
local UseSearchParametersModule = require(Modules.AvatarExperience.Catalog.Hooks.useSearchParameters)
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local AxTopics = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.topics")
local AXTopicsNumInitialItems = game:DefineFastInt("AXTopicsNumInitialItems", 10)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXCatalogSearchSupportDisableFilters = AvatarExperienceFlagsModule.FFlagAXCatalogSearchSupportDisableFilters
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

local function findRemovedTopic(SelectedPills, p1)
	-- upvalues: CryoModule (copy)
	for _, selectedPill in SelectedPills do
		if not CryoModule.List.find(p1, selectedPill) then
			return selectedPill
		end
	end
	return nil
end

local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p2)
	-- upvalues: CryoModule (copy), AXTopicsNumInitialItems (copy)
	return CryoModule.List.filterMap(p2, function(p3, p4)
		-- upvalues: AXTopicsNumInitialItems (upval)
		return if AXTopicsNumInitialItems < p4 then nil else { targetId = tonumber(p3.id) or 0, itemType = p3.type }
	end)
end)

return (ReactModule.memo(function(Gui)
	-- upvalues: MemoizeResult (copy), UseSelectedTopicsModule (copy), UseCatalogTopicsModule (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), ReactModule (copy), GetCatalogCategoriesStoreModule (copy), CryoModule (copy), findRemovedTopic (copy), AxTopics (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseSearchParametersModule (copy), NavigateToSearchModule (copy), Exit3DFullViewModule (copy), FilterButtonLayoutModule (copy), ConstantsModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), FFlagAXCatalogSearchSupportDisableFilters (copy), PillGroup (copy)
	local MemoizeResultResult = MemoizeResult(Gui.items or {})
	local SearchKeyword = Gui.searchKeyword
	local UseSelectedTopicsModuleResult, UseSelectedTopicsModuleResult2 = UseSelectedTopicsModule()
	local UseCatalogTopicsModuleResult, UseCatalogTopicsModuleResult2 = UseCatalogTopicsModule(UseSelectedTopicsModuleResult, MemoizeResultResult, SearchKeyword)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseCatalogTopicsModuleResult (copy), UseSelectedTopicsModuleResult (copy), GetCatalogCategoriesStoreModule (upval), CryoModule (upval), UseRoactServiceModuleResult (copy), findRemovedTopic (upval), AxTopics (upval)
		local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
		local SelectedCategoryIdResult = CatalogSelectionStore.selectedCategoryId(false)
		local SelectedSubcategoryIdResult = CatalogSelectionStore.selectedSubcategoryId(false)
		
		if #UseSelectedTopicsModuleResult < #p2 then
			local v1 = p2[#p2]
			UseRoactServiceModuleResult.selectTopic(v1, CryoModule.List.find(UseCatalogTopicsModuleResult, v1) or 0, SelectedCategoryIdResult, SelectedSubcategoryIdResult, nil, UseCatalogTopicsModuleResult, UseSelectedTopicsModuleResult)
			
			return
		end
		if #p2 ~= #UseSelectedTopicsModuleResult - 1 then
			AxTopics:warning("sendTopicsChangedAnalyticsEvent, invalid change: {} -> {}", UseSelectedTopicsModuleResult, p2)
		elseif not findRemovedTopic(UseSelectedTopicsModuleResult, p2) then
			AxTopics:warning("sendTopicsChangedAnalyticsEvent, removedTopic not found: {} -> {}", UseSelectedTopicsModuleResult, p2)
			
			return
		end
	end, {
		UseSelectedTopicsModuleResult,
		UseCatalogTopicsModuleResult,
		findRemovedTopic
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseSearchParametersModuleResult = UseSearchParametersModule()
	
	return ReactModule.createElement(FilterButtonLayoutModule, {
		height = ConstantsModule.PillBarHeight,
		layoutOrder = Gui.layoutOrder,
		showFilterButton = not FFlagAXMigrateAllTabToSduiDev and not FFlagAXMoveCatalogFilterToL1Navigation and (not FFlagAXCatalogSearchSupportDisableFilters or Gui.showFilterButton == nil or Gui.showFilterButton),
		layoutRef = Gui.frameRef,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown
	}, {
		Topics = ReactModule.createElement(PillGroup, {
			layoutOrder = 2,
			leftPadding = 0,
			pills = UseCatalogTopicsModuleResult,
			selectedPills = UseSelectedTopicsModuleResult,
			isLoading = UseCatalogTopicsModuleResult2,
			onSelectionChanged = ReactModule.useCallback(function(p2)
				-- upvalues: UseResult (copy), Gui (copy), UseSearchParametersModuleResult (ref), UseSelectedTopicsModuleResult2 (copy), UseDispatchResult (copy), NavigateToSearchModule (upval), UseNavigationResult (copy), Exit3DFullViewModule (upval), UseRoactServiceModuleResult1 (copy)
				UseResult(p2)
				
				if Gui.searchKeyword then
					UseSearchParametersModuleResult = UseSearchParametersModuleResult or {}
					assert(UseSearchParametersModuleResult, "")
					UseSelectedTopicsModuleResult2(p2)
					UseDispatchResult(NavigateToSearchModule(UseNavigationResult, UseSearchParametersModuleResult))
				else
					UseSelectedTopicsModuleResult2(p2)
				end
				UseDispatchResult(Exit3DFullViewModule(UseRoactServiceModuleResult1, UseNavigationResult.state.routeName))
			end, {
				UseResult, Gui.searchKeyword, UseSearchParametersModuleResult,
				UseDispatchResult, UseNavigationResult, UseRoactServiceModuleResult1
			})
		})
	})
end))