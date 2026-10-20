local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local InventoryFilters = AvatarExperienceSlotBasedEditorModule.Enums.InventoryFilters
local InventoryItemType = AvatarExperienceSlotBasedEditorModule.Enums.InventoryItemType
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local UseAvatarEditorStoresFunction = AvatarExperienceSlotBasedEditorModule.Context.useAvatarEditorStores
local UseAvatarSaveContextFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local GetUserInventoryV2Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2)
local GetUprankedItemsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetUprankedItems)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local SendShopForMoreAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics)
local SelectOwnedItemIdToIsWearingModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectOwnedItemIdToIsWearing)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local FFlagAXAvatarEditorStoresContext = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local InventoryItemCardContainerModule = require(script.Parent.Parent.InventoryItemCard.InventoryItemCardContainer)
local CatalogItemCardContainerModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local _ = require(script.Parent.InventoryItemsList)
local UseInventoryItemsModule = require(script.Parent.useInventoryItems)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local CatalogItemCardStatusIconTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local UseAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useAdaptiveScrolling
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXAddInventoryItemsListProps = AvatarExperienceFlagsModule.FFlagAXAddInventoryItemsListProps
local FIntAXDefaultInventoryPageSize = AvatarExperienceFlagsModule.FIntAXDefaultInventoryPageSize
local FFlagAXUprankBundlesModule = require(Modules.AvatarExperience.Flags.FFlagAXUprankBundles)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXTTIEditorEnableMilestones = AvatarExperienceFlagsModule.FFlagAXTTIEditorEnableMilestones
local FFlagAXRefetchInventoryOnAssetGrant = AvatarExperienceFlagsModule.FFlagAXRefetchInventoryOnAssetGrant
local UseRefetchStaleInventoryCategoryModule = require(script.Parent.Parent.Parent.Hooks.useRefetchStaleInventoryCategory)

local function selectCurrentOwnedItemIdToIsWearing(p1)
	-- upvalues: UtilsModule (copy), SelectOwnedItemIdToIsWearingModule (copy)
	return SelectOwnedItemIdToIsWearingModule(p1, (UtilsModule.selectAssetTypeKey(p1)))
end

local function selectAnalyticsMetadata(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

return function(p1)
	-- upvalues: ReactModule (copy), RoactGamepadModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseAvatarSaveContextFunction (copy), SignalsReactModule (copy), UseAdaptiveScrollingFunction (copy), FFlagAXAvatarEditorStoresContext (copy), UseAvatarEditorStoresFunction (copy), UseSlotBasedEditorContextFunction (copy), ConstantsModule1 (copy), UseAppPolicyModule (copy), Signal (copy), UseSelectorFunction (copy), UtilsModule1 (copy), FFlagAXAddInventoryItemsListProps (copy), selectCurrentOwnedItemIdToIsWearing (copy), selectAnalyticsMetadata (copy), PerformFetch (copy), FFlagAXInventoryDurablesExpiredFilter (copy), UseInventoryItemsModule (copy), UseSignalStateFunction (copy), FFlagAXUprankBundlesModule (copy), GetUprankedItemsModule (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), GetUserInventoryV2Module (copy), FFlagAXTTIEditorEnableMilestones (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), UseRefetchStaleInventoryCategoryModule (copy), InventoryFilters (copy), InventoryItemType (copy), ConstantsModule2 (copy), CatalogItemCardContainerModule (copy), FIntAXDefaultInventoryPageSize (copy), CatalogConstantsModule (copy), CatalogItemCardStatusIconTypeEnum (copy), InventoryItemCardContainerModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), SendShopForMoreAnalyticsModule (copy), ConstantsModule (copy), RetrievalStatusModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseAvatarSaveContextFunction().getLastSuccessfullySavedStateSignal)
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local NoUseAdaptiveScrollingResult = not UseAdaptiveScrollingResult or not UseAdaptiveScrollingResult.scrollingEnabledBinding or UseAdaptiveScrollingResult.scrollingEnabledBinding
	local v1 = nil
	local v2 = nil
	
	if FFlagAXAvatarEditorStoresContext then
		v1 = UseAvatarEditorStoresFunction()
	else
		v2 = UseSlotBasedEditorContextFunction()
		assert(v2, "InventoryItemsList must be used within a SlotBasedEditorContextProvider")
	end
	local Key: string = UseAvatarRouteResult.current.key
	local Text = ConstantsModule1.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else "")
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getEnableContinuousLoad()
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseSelectorResult = UseSelectorFunction(UtilsModule1.getAvatarEditorCategoryInfoFromState)
	local UseSelectorResult1 = UseSelectorFunction(UtilsModule1.getAvatarEditorSubcategoryFilterFromState)
	
	if FFlagAXAddInventoryItemsListProps then
		UseSelectorResult = p1.categoryInfo
		UseSelectorResult1 = p1.subcategoryFilter
	end
	local UseSelectorResult1_1 = UseSelectorResult1 or UseSelectorResult
	local UseSelectorResult2 = UseSelectorFunction(selectCurrentOwnedItemIdToIsWearing)
	local UseSelectorResult3 = UseSelectorFunction(selectAnalyticsMetadata)
	local UseSelectorResult4 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: PerformFetch (upval), UseSelectorResult1_1 (copy)
		return PerformFetch.GetStatus(p2, UseSelectorResult1_1.SearchUuid)
	end, { UseSelectorResult1_1.SearchUuid })))
	local CategoryInventoryStore = if FFlagAXAvatarEditorStoresContext then v1.categoryInventoryStores[UseSelectorResult1_1.NavigationKey] else v2.categoryInventoryStores[UseSelectorResult1_1.NavigationKey]
	local SortAndFiltersStore = if FFlagAXInventoryDurablesExpiredFilter then if FFlagAXAvatarEditorStoresContext then v1.sortAndFiltersStore else v2.sortAndFiltersStore else nil
	local UseInventoryItemsModuleResult = UseInventoryItemsModule(CategoryInventoryStore, UseSelectorResult1_1, if FFlagAXInventoryDurablesExpiredFilter then SortAndFiltersStore elseif FFlagAXAvatarEditorStoresContext then v1.sortAndFiltersStore else v2.sortAndFiltersStore)
	local UseSignalStateResult1 = UseSignalStateFunction(CategoryInventoryStore.getHasReachedLastPage)
	local UseSignalStateResult2 = UseSignalStateFunction(CategoryInventoryStore.getSearchUuid)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseMemoResult (copy), p1 (copy), UseAdaptiveScrollingResult (copy)
		UseMemoResult:fire()
		
		if p1 and p1.onContentScroll then
			p1.onContentScroll(ScrollFrame)
		end
		if UseAdaptiveScrollingResult and UseAdaptiveScrollingResult.onCanvasYChanged then
			UseAdaptiveScrollingResult.onCanvasYChanged(ScrollFrame.CanvasPosition.Y)
		end
	end, { UseAdaptiveScrollingResult, p1 })
	
	if FFlagAXUprankBundlesModule() then
		ReactModule.useEffect(function()
			-- upvalues: UseDispatchResult (copy), GetUprankedItemsModule (upval), UseRoactServiceModuleResult (copy)
			UseDispatchResult(GetUprankedItemsModule(UseRoactServiceModuleResult))
		end, { UseSignalStateResult, UseDispatchResult })
	end
	local UseResult1 = if GetFFlagAXEnableInventorySortsAndFiltersModule() then ReactModule.useCallback(function()
		-- upvalues: CategoryInventoryStore (copy), UseDispatchResult (copy), GetUserInventoryV2Module (upval), UseRoactServiceModuleResult (copy), UseSelectorResult1_1 (copy), FFlagAXAddInventoryItemsListProps (upval), p1 (copy), SortAndFiltersStore (copy), FFlagAXTTIEditorEnableMilestones (upval)
		if not CategoryInventoryStore.getHasReachedLastPage(false) then
			UseDispatchResult(GetUserInventoryV2Module(UseRoactServiceModuleResult, UseSelectorResult1_1, nil, CategoryInventoryStore, if FFlagAXAddInventoryItemsListProps and p1 and p1.disableSortsAndFilters then nil else SortAndFiltersStore, if FFlagAXTTIEditorEnableMilestones then true else nil))
		end
	end, {
		UseDispatchResult,
		UseRoactServiceModuleResult,
		UseSelectorResult1_1,
		CategoryInventoryStore,
		SortAndFiltersStore
	}) else ReactModule.useCallback(function()
		-- upvalues: CategoryInventoryStore (copy), UseDispatchResult (copy), GetUserInventoryV2Module (upval), UseRoactServiceModuleResult (copy), UseSelectorResult1_1 (copy), FFlagAXTTIEditorEnableMilestones (upval)
		if not CategoryInventoryStore.getHasReachedLastPage(false) then
			UseDispatchResult(GetUserInventoryV2Module(UseRoactServiceModuleResult, UseSelectorResult1_1, nil, CategoryInventoryStore, nil, if FFlagAXTTIEditorEnableMilestones then true else nil))
		end
	end, {
		UseDispatchResult,
		UseRoactServiceModuleResult,
		UseSelectorResult1_1,
		CategoryInventoryStore
	})
	
	if FFlagAXRefetchInventoryOnAssetGrant then
		UseRefetchStaleInventoryCategoryModule(UseSelectorResult1_1.SearchUuid, CategoryInventoryStore, UseResult1)
	end
	local UseSignalStateResult3 = if FFlagAXInventoryDurablesExpiredFilter then UseSignalStateFunction(SortAndFiltersStore.getSortAndFilters) else nil
	local IsFilterMatch = if FFlagAXInventoryDurablesExpiredFilter then UseSignalStateResult3.filter == InventoryFilters.Expired else nil
	local CatalogItemTile = if FFlagAXInventoryDurablesExpiredFilter and IsFilterMatch and UseInventoryItemsModuleResult and #UseInventoryItemsModuleResult > 0 and UseInventoryItemsModuleResult[1].itemId ~= nil then ConstantsModule2.ItemTileType.CatalogItemTile else nil
	
	return {
		items = UseInventoryItemsModuleResult,
		scrollingEnabled = NoUseAdaptiveScrollingResult,
		showLoadMoreButton = not UseAppPolicyModuleResult and (not UseSignalStateResult1 and UseSelectorResult4 ~= RetrievalStatusModule.Fetching),
		showRecommendedItems = (if FFlagAXAddInventoryItemsListProps then p1 and (p1.showRecommendedItems and (UseSelectorResult.RecommendationsType and (UseSelectorResult.RecommendationsType ~= ConstantsModule.RecommendationsType.None and UseSignalStateResult1))) else UseSelectorResult.RecommendationsType and (UseSelectorResult.RecommendationsType ~= ConstantsModule.RecommendationsType.None and UseSignalStateResult1)) or false,
		fetchStatus = UseSelectorResult4,
		impressionsTag = Text,
		searchUuid = UseSignalStateResult2,
		categoryInfo = UseSelectorResult,
		subcategoryFilter = UseSelectorResult1,
		analyticsMetadata = UseSelectorResult3,
		requestImpressionsSignal = UseMemoResult,
		itemDetailsPeekViewRefs = UseRefCacheResult,
		fetchUserInventory = UseResult1,
		sendShopForMoreAnalytics = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), SendShopForMoreAnalyticsModule (upval), UseRoactServiceModuleResult1 (copy)
			UseDispatchResult(SendShopForMoreAnalyticsModule(UseRoactServiceModuleResult1))
		end, { UseDispatchResult, UseRoactServiceModuleResult1 }),
		onCanvasPositionChanged = UseResult,
		renderItem = function(p2)
			-- upvalues: FFlagAXAddInventoryItemsListProps (upval), p1 (copy), UseSelectorResult2 (copy), UseRefResult (copy), UseRefCacheResult (copy), Text (copy), FFlagAXInventoryDurablesExpiredFilter (upval), IsFilterMatch (copy), InventoryItemType (upval), ConstantsModule2 (upval), ReactModule (upval), CatalogItemCardContainerModule (upval), FIntAXDefaultInventoryPageSize (upval), CatalogConstantsModule (upval), UseSelectorResult (ref), UseSelectorResult1 (ref), CatalogItemCardStatusIconTypeEnum (upval), InventoryItemCardContainerModule (upval), FFlagAXModeratedItemsFlow (upval), FFlagAXEnableModeratedItemsFlowForDurables (upval)
			return if FFlagAXAddInventoryItemsListProps and p1 and p1.renderItem then p1.renderItem(p2, {
				ownedItemIdToIsWearing = UseSelectorResult2,
				gridRef = UseRefResult,
				itemDetailsPeekViewRefs = UseRefCacheResult,
				impressionsTag = Text
			}) elseif FFlagAXInventoryDurablesExpiredFilter and IsFilterMatch and p2.item.itemId then ReactModule.createElement(CatalogItemCardContainerModule, {
				impressionsSchema = "defaultItem",
				isTitleVisible = true,
				isPriceVisible = true,
				isCreatorNameVisible = true,
				isOrganic = true,
				itemId = p2.item.itemId,
				itemType = if p2.item.inventoryItemType == InventoryItemType.Asset then ConstantsModule2.ItemType.Asset else ConstantsModule2.ItemType.Bundle,
				index = p2.index,
				analyticsItemCountPerPage = FIntAXDefaultInventoryPageSize,
				analyticsContext = CatalogConstantsModule.AnalyticsContext.AvatarEditorExpiredItem,
				itemDetailsPeekViewRefs = UseRefCacheResult,
				resultsListRef = UseRefResult,
				gridInformation = if p2.gridInformation then {
					gridPositionRow = p2.gridInformation.row,
					gridPositionColumn = p2.gridInformation.column
				} else nil,
				impressionsTag = Text,
				impressionsId = p2.item.itemId,
				impressionsCategory = UseSelectorResult.Name,
				impressionsSubcategory = if UseSelectorResult1 then UseSelectorResult1.Name else nil,
				itemStatusOverride = {
					type = "icon",
					iconType = CatalogItemCardStatusIconTypeEnum.Durable
				}
			}) else ReactModule.createElement(InventoryItemCardContainerModule, {
				impressionsSchema = "defaultItem",
				inventoryItemType = p2.item.inventoryItemType,
				itemId = p2.item.itemId,
				isSelected = p2.item.itemId ~= nil and UseSelectorResult2[p2.item.itemId],
				resultsListRef = UseRefResult,
				itemDetailsPeekViewRefs = UseRefCacheResult,
				gridInformation = p2.gridInformation,
				impressionsTag = Text,
				hideName = not UseSelectorResult.ShowName,
				availabilityStatus = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p2.item.availabilityStatus else nil
			})
		end,
		impressionsPageFilter = ReactModule.useCallback(function(): boolean
			-- upvalues: Key (copy), UseNavigationResult (copy)
			return Key == UseNavigationResult.state.key
		end, { Key, UseNavigationResult.state.key }),
		onListEndReached = if UseAppPolicyModuleResult and not UseSignalStateResult1 and UseSelectorResult4 ~= RetrievalStatusModule.Fetching then UseResult1 else nil,
		itemTileType = if FFlagAXInventoryDurablesExpiredFilter then CatalogItemTile else nil
	}
end