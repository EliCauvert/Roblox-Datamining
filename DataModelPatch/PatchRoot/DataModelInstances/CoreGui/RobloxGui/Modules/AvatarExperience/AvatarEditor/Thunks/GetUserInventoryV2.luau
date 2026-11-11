local CorePackages = game:GetService("CorePackages")
local MemStorageService = game:GetService("MemStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local DashModule = require(CorePackages.Packages.Dash)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local InventorySorts = AvatarExperienceSlotBasedEditorModule.Enums.InventorySorts
local InventoryFilterToAvailabilityStatus = AvatarExperienceSlotBasedEditorModule.Constants.InventoryFilterToAvailabilityStatus
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCustomizeBackgrounds = AvatarExperienceFlagsModule.FFlagAXCustomizeBackgrounds
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SetOwnedItemIdsBySubtypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local SetPageFinishedModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local SetOutfitOrAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset)
local SetAssetInfoFromInventoryFetchModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch)
local GetOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local BatchGetOutfitsModule = require(Modules.AvatarExperience.Common.Thunks.BatchGetOutfits)
local GetStaleInventoryGrantStoreFunction = AvatarExperienceSlotBasedEditorModule.Stores.getStaleInventoryGrantStore
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local FetchAssetOrBundleInfoBatchedModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfoBatched)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local FFlagAXInventoryV2CombineGetOutfitDispatchesModule = require(Modules.AvatarExperience.Flags.FFlagAXInventoryV2CombineGetOutfitDispatches)
local FIntAXDefaultInventoryPageSize = AvatarExperienceFlagsModule.FIntAXDefaultInventoryPageSize
local GetFFlagAXRemoveAwaitUsageInThunksModule = require(Modules.AvatarExperience.Flags.GetFFlagAXRemoveAwaitUsageInThunks)
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXPhotoboothIsStandalone = AvatarExperienceFlagsModule.FFlagAXPhotoboothIsStandalone
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlagsModule.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXFixStaleModerationStatusFromGrant = AvatarExperienceFlagsModule.FFlagAXFixStaleModerationStatusFromGrant
local FFlagAXFixIecModerationFromInventoryFetch = AvatarExperienceFlagsModule.FFlagAXFixIecModerationFromInventoryFetch
local FFlagAXRefetchInventoryOnAssetGrant = AvatarExperienceFlagsModule.FFlagAXRefetchInventoryOnAssetGrant
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXTTIEditorEnableMilestones = AvatarExperienceFlagsModule.FFlagAXTTIEditorEnableMilestones
local EditorInventoryTTIMilestoneManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).EditorInventoryTTIMilestoneManager

local function checkAndSendDuplicateItemCount(State, SearchUuid, List)
	-- upvalues: DashModule (copy), SendAXCounterV2Function (copy), ConstantsModule1 (copy)
	local OwnedItemIdsBySubtypeEntry = State.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[SearchUuid]
	
	if not OwnedItemIdsBySubtypeEntry or #OwnedItemIdsBySubtypeEntry == 0 then return end
	local KeyByResult = DashModule.keyBy(OwnedItemIdsBySubtypeEntry, function(p1)
		return p1
	end)
	
	for _, value in List do
		if KeyByResult[value] then
			SendAXCounterV2Function(ConstantsModule1.Counter.AvatarInventory.ReceivedDuplicateItem)
		else
			KeyByResult[value] = value
		end
	end
end

local function getRequestItemCategoriesFromInfo(CategoryInfo)
	-- upvalues: GetFFlagAXEnableNewInventoryItemsListModule (copy), AvatarEditorCategories (copy), ConstantsModule (copy), ConstantsModule1 (copy)
	local List = {}
	
	if GetFFlagAXEnableNewInventoryItemsListModule() and CategoryInfo.NavigationKey == AvatarEditorCategories.All then
		return {}
	end
	if CategoryInfo.AssetTypeIdStrings then
		for _, assetTypeIdString in CategoryInfo.AssetTypeIdStrings do
			table.insert(List, {
				itemType = string.lower(ConstantsModule.OutfitOrAsset.Asset or "asset"),
				itemSubType = tonumber(assetTypeIdString)
			})
		end
	end
	if GetFFlagAXEnableNewInventoryItemsListModule() then
		if CategoryInfo.BundleTypeIdStrings then
			for _, bundleTypeIdString in CategoryInfo.BundleTypeIdStrings do
				local BundleTypeIdStringsForBackendEntry = ConstantsModule1.BundleTypeIdStringsForBackend[bundleTypeIdString]
				
				if BundleTypeIdStringsForBackendEntry then
					table.insert(List, {
						itemType = string.lower(ConstantsModule.OutfitOrAsset.Outfit or "outfit"),
						itemSubType = tonumber(BundleTypeIdStringsForBackendEntry)
					})
				end
			end
			return List
		end
	elseif CategoryInfo.OutfitTypeIdStrings then
		for _, outfitTypeIdString in CategoryInfo.OutfitTypeIdStrings do
			local BundleTypeIdStringsForBackendEntry = ConstantsModule1.BundleTypeIdStringsForBackend[outfitTypeIdString]
			
			if BundleTypeIdStringsForBackendEntry then
				table.insert(List, {
					itemType = string.lower(ConstantsModule.OutfitOrAsset.Outfit or "outfit"),
					itemSubType = tonumber(BundleTypeIdStringsForBackendEntry)
				})
			end
		end
	end
	return List
end

local function _(Key)
	-- upvalues: MemStorageService (copy)
	return if Key then MemStorageService:GetItem(Key) else nil
end

local _ = function(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromInventoryFetch then true else false
end

local _ = function(p1, p2): boolean
	return p1.AvatarExperience.AvatarEditor.OutfitInfos[p2] ~= nil
end

local config = {
	PendingReview = Enum.ModerationStatus.NotReviewed,
	Unavailable = Enum.ModerationStatus.ReviewedRejected
}
local Callback = if FFlagAXInventoryDurablesExpiredFilter then function(p1, p2, List)
	-- upvalues: ConstantsModule1 (copy), FetchAssetOrBundleInfoBatchedModule (copy)
	local List1 = {}
	
	for _, value in List do
		local Asset = nil
		
		if value.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then
			Asset = ConstantsModule1.ItemType.Asset
		elseif value.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then
			Asset = ConstantsModule1.ItemType.Bundle
		end
		if Asset then
			table.insert(List1, { id = tostring(value.itemId), itemType = Asset })
		end
	end
	if #List1 > 0 then
		p2:dispatch(FetchAssetOrBundleInfoBatchedModule(p1, nil, List1, true))
	end
end else nil

local function v54(p3)
	-- upvalues: GetFFlagAXEnableNewInventoryItemsListModule (copy), FFlagAXPhotoboothIsStandalone (copy), FFlagAXTTIEditorEnableMilestones (copy), EditorInventoryTTIMilestoneManager (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), FFlagAXFixIecModerationFromInventoryFetch (copy), config (copy), FFlagAXFixStaleModerationStatusFromGrant (copy), UtilsModule (copy), ConstantsModule1 (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXInventoryV2CombineGetOutfitDispatchesModule (copy), GetOutfitModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), SetAssetInfoFromInventoryFetchModule (copy), checkAndSendDuplicateItemCount (copy), BatchGetOutfitsModule (copy), SetOutfitOrAssetModule (copy), ConstantsModule (copy), SetOwnedItemIdsBySubtypeModule (copy), GetStaleInventoryGrantStoreFunction (copy), FFlagAXInventoryDurablesExpiredFilter (copy), Callback (copy), MemStorageService (copy), SetPageFinishedModule (copy)
	if (GetFFlagAXEnableNewInventoryItemsListModule() or FFlagAXPhotoboothIsStandalone) and p3.categoryInventoryStore then
		p3.categoryInventoryStore.addResultsPage(p3.results)
	end
	local Store = p3.store
	local SearchUuid = p3.searchUuid
	local Results = p3.results
	local ResolveFunction: (any) -> () = p3.resolve
	local IsTtiSessionGenerationMatch: boolean = FFlagAXTTIEditorEnableMilestones and (p3.shouldTrackTTI == true and (p3.ttiSessionGeneration ~= nil and (EditorInventoryTTIMilestoneManager ~= nil and p3.ttiSessionGeneration == EditorInventoryTTIMilestoneManager.getSessionGeneration())))
	local State = Store:getState()
	local IsIsStaleCategoryRefetch = if FFlagAXRefetchInventoryOnAssetGrant then p3.isStaleCategoryRefetch == true else nil
	local AvatarInventoryItems = Results.avatarInventoryItems or {}
	
	if FFlagAXTTIEditorEnableMilestones and IsTtiSessionGenerationMatch and EditorInventoryTTIMilestoneManager then
		EditorInventoryTTIMilestoneManager.L2.primaryDataReady()
		EditorInventoryTTIMilestoneManager.L3.getInventoryV2Completed()
	end
	local t = {}
	local t1 = {}
	local t2 = {}
	local List = {}
	
	for _, avatarInventoryItem in AvatarInventoryItems do
		local Text = tostring(avatarInventoryItem.itemId)
		local ItemCategory = avatarInventoryItem.itemCategory
		t2[#t2 + 1] = Text
		
		if ItemCategory.itemType ~= Enum.AvatarItemType.Asset.Value then
			if ItemCategory.itemType == Enum.AvatarItemType.Bundle.Value then
				t1[#t1 + 1] = Text
				
				if State.AvatarExperience.AvatarEditor.OutfitInfos[Text] == nil then
					if not FFlagAXInventoryV2CombineGetOutfitDispatchesModule then
						Store:dispatch(GetOutfitModule(Text, nil, nil, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p3.networkImpl else nil))
						continue
					else
						table.insert(List, Text)
						continue
					end
				end
				continue
			end
			continue
		end
		if not IsIsStaleCategoryRefetch then
			local AssetInfo = State.AvatarExperience.Common.AssetInfos[Text]
			
			if if AssetInfo and AssetInfo.receivedFromInventoryFetch then true else false then
				continue
			end
		end
		local ModerationStatusFromAvailabilityStatus = nil
		local CreatingUniverseId: string? = nil
		local AvailabilityStatus = avatarInventoryItem.availabilityStatus
		
		if AvailabilityStatus then
			ModerationStatusFromAvailabilityStatus = if FFlagAXFixIecModerationFromInventoryFetch and avatarInventoryItem.creatingUniverseId then config[AvailabilityStatus] elseif FFlagAXFixStaleModerationStatusFromGrant then UtilsModule.getModerationStatusFromAvailabilityStatus(AvailabilityStatus) else config[AvailabilityStatus]
		end
		if avatarInventoryItem.creatingUniverseId then
			CreatingUniverseId = tostring(avatarInventoryItem.creatingUniverseId)
		end
		t[#t + 1] = {
			assetId = avatarInventoryItem.itemId,
			name = avatarInventoryItem.itemName,
			assetType = ConstantsModule1.AssetTypeIdStringToName[tostring(ItemCategory.itemSubType)],
			moderationStatus = ModerationStatusFromAvailabilityStatus,
			creatingUniverseId = CreatingUniverseId,
			expirationTime = if FFlagAXInventoryDurablesSupport then avatarInventoryItem.expirationTime else nil
		}
	end
	if FFlagAXTTIEditorEnableMilestones and IsTtiSessionGenerationMatch and EditorInventoryTTIMilestoneManager then
		EditorInventoryTTIMilestoneManager.L2.dataProcessingStarted()
	end
	if #t > 0 then
		Store:dispatch(SetAssetInfoFromInventoryFetchModule(t))
	end
	checkAndSendDuplicateItemCount(State, SearchUuid, t2)
	
	if FFlagAXInventoryV2CombineGetOutfitDispatchesModule then
		Store:dispatch(BatchGetOutfitsModule(List, if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p3.networkImpl else nil))
	end
	Store:dispatch(SetOutfitOrAssetModule(t1, ConstantsModule.OutfitOrAsset.Outfit))
	Store:dispatch(SetOwnedItemIdsBySubtypeModule(SearchUuid, t2))
	
	if FFlagAXRefetchInventoryOnAssetGrant and IsIsStaleCategoryRefetch then
		GetStaleInventoryGrantStoreFunction().clearSearchUuidStale(SearchUuid)
	end
	if FFlagAXTTIEditorEnableMilestones and IsTtiSessionGenerationMatch and EditorInventoryTTIMilestoneManager then
		EditorInventoryTTIMilestoneManager.L2.dataProcessingCompleted()
	end
	if FFlagAXInventoryDurablesExpiredFilter and p3.shouldFetchItemDetails then
		Callback(p3.networkImpl, Store, AvatarInventoryItems)
	end
	local ReachedLastPage = nil
	
	if Results then
		local NextPageToken = Results.nextPageToken
		
		if NextPageToken and NextPageToken ~= "" then
			MemStorageService:SetItem(SearchUuid, NextPageToken)
		else
			Store:dispatch(SetPageFinishedModule(SearchUuid, true))
			MemStorageService:SetItem(SearchUuid, ConstantsModule.ReachedLastPage)
			ReachedLastPage = ConstantsModule.ReachedLastPage
		end
	end
	ResolveFunction(ReachedLastPage)
end

local function fetchItems(p4)
	-- upvalues: FIntAXDefaultInventoryPageSize (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), InventorySorts (copy), FFlagAXInventoryDurablesExpiredFilter (copy), InventoryFilterToAvailabilityStatus (copy), FFlagAXTTIEditorEnableMilestones (copy), GetFFlagAXRemoveAwaitUsageInThunksModule (copy), EditorInventoryTTIMilestoneManager (copy), WebApiModule (copy), getRequestItemCategoriesFromInfo (copy), v54 (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), FFlagAXPhotoboothIsStandalone (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), FFlagAXRootSlotBasedEditorFlag (copy)
	local SortAndFilters = if GetFFlagAXEnableInventorySortsAndFiltersModule() and p4.sortAndFiltersStore then p4.sortAndFiltersStore.getSortAndFilters(false) else nil
	local RecentEquipped: string = if GetFFlagAXEnableInventorySortsAndFiltersModule() and SortAndFilters and SortAndFilters.sort == InventorySorts.RecentlyWorn then "recentEquipped" else "recentAdded"
	local v1: boolean? = nil
	local v2 = nil
	
	if FFlagAXInventoryDurablesExpiredFilter and GetFFlagAXEnableInventorySortsAndFiltersModule() and SortAndFilters then
		v2 = InventoryFilterToAvailabilityStatus[SortAndFilters.filter]
		v1 = v2 ~= nil
	end
	local IsNotNextPageCursorMatch: boolean = FFlagAXTTIEditorEnableMilestones and (p4.nextPageCursor ~= nil and p4.nextPageCursor ~= "")
	local NoIsNotNextPageCursorMatch: boolean = FFlagAXTTIEditorEnableMilestones and (p4.trackTTI == true and not IsNotNextPageCursorMatch)
	local SessionGeneration = nil
	
	if GetFFlagAXRemoveAwaitUsageInThunksModule() then
		if FFlagAXTTIEditorEnableMilestones and NoIsNotNextPageCursorMatch and EditorInventoryTTIMilestoneManager then
			EditorInventoryTTIMilestoneManager.startTracking()
			SessionGeneration = EditorInventoryTTIMilestoneManager.getSessionGeneration()
			EditorInventoryTTIMilestoneManager.L2.primaryDataStarted()
			EditorInventoryTTIMilestoneManager.L3.networkFetch()
			EditorInventoryTTIMilestoneManager.L3.getInventoryV2Started()
		end
		return WebApiModule.GetUserAvatarInventory(p4.networkImpl, getRequestItemCategoriesFromInfo(p4.categoryInfo), RecentEquipped, FIntAXDefaultInventoryPageSize, p4.nextPageCursor, if FFlagAXInventoryDurablesExpiredFilter then v2 else nil):andThen(function(Result)
			-- upvalues: v54 (upval), p4 (copy), GetFFlagAXEnableNewInventoryItemsListModule (upval), FFlagAXPhotoboothIsStandalone (upval), FFlagAXInventoryDurablesExpiredFilter (upval), v1 (ref), FFlagAXTTIEditorEnableMilestones (upval), NoIsNotNextPageCursorMatch (copy), SessionGeneration (ref), FFlagAXRefetchInventoryOnAssetGrant (upval)
			v54({
				networkImpl = p4.networkImpl,
				results = Result.responseBody,
				searchUuid = p4.searchUuid,
				store = p4.store,
				resolve = p4.resolve,
				categoryInventoryStore = if GetFFlagAXEnableNewInventoryItemsListModule() or FFlagAXPhotoboothIsStandalone then p4.categoryInventoryStore else nil,
				shouldFetchItemDetails = if FFlagAXInventoryDurablesExpiredFilter then v1 else nil,
				shouldTrackTTI = if FFlagAXTTIEditorEnableMilestones then NoIsNotNextPageCursorMatch else nil,
				ttiSessionGeneration = if FFlagAXTTIEditorEnableMilestones then SessionGeneration else nil,
				isStaleCategoryRefetch = if FFlagAXRefetchInventoryOnAssetGrant then p4.isStaleCategoryRefetch else nil
			})
		end):catch(function(Err)
			-- upvalues: p4 (copy)
			warn("GetUserInventoryV2 failure: ", Err)
			
			return p4.reject()
		end)
	else
		local v3, v4 = WebApiModule.GetUserAvatarInventory(p4.networkImpl, getRequestItemCategoriesFromInfo(p4.categoryInfo), RecentEquipped, FIntAXDefaultInventoryPageSize, p4.nextPageCursor, if FFlagAXInventoryDurablesExpiredFilter then v2 else nil):await()
		
		if v3 then
			v54({
				networkImpl = p4.networkImpl,
				results = v4.responseBody,
				searchUuid = p4.searchUuid,
				store = p4.store,
				resolve = p4.resolve,
				categoryInventoryStore = if GetFFlagAXEnableNewInventoryItemsListModule() or FFlagAXPhotoboothIsStandalone then p4.categoryInventoryStore else nil,
				shouldFetchItemDetails = if FFlagAXInventoryDurablesExpiredFilter then v1 else nil,
				shouldTrackTTI = if FFlagAXTTIEditorEnableMilestones then NoIsNotNextPageCursorMatch else nil,
				ttiSessionGeneration = if FFlagAXTTIEditorEnableMilestones then SessionGeneration else nil,
				isStaleCategoryRefetch = if FFlagAXRefetchInventoryOnAssetGrant then p4.isStaleCategoryRefetch else nil
			})
			
			return
		end
		warn("GetUserInventoryV2 failure: ", v4)
		
		return p4.reject(if FFlagAXRootSlotBasedEditorFlag then v4 else nil)
	end
end

return function(NetworkImpl, CategoryInfo, _, p4, p5, p6)
	-- upvalues: ArgCheckModule (copy), FFlagAXCustomizeBackgrounds (copy), FFlagAXBackgroundsCustomizeHydration (copy), AvatarEditorCategories (copy), SetPageFinishedModule (copy), MemStorageService (copy), ConstantsModule (copy), PromiseModule (copy), UtilsModule1 (copy), FFlagAXEditorSubcategoryFilters (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), GetStaleInventoryGrantStoreFunction (copy), PerformFetch (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), fetchItems (copy), FFlagAXPhotoboothIsStandalone (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), FFlagAXTTIEditorEnableMilestones (copy), MutedErrorModule (copy)
	ArgCheckModule.isType(CategoryInfo, "table", "GetUserInventoryV2 thunk expects categoryInfo to be a table")
	
	return function(Store)
		-- upvalues: FFlagAXCustomizeBackgrounds (upval), FFlagAXBackgroundsCustomizeHydration (upval), CategoryInfo (copy), AvatarEditorCategories (upval), SetPageFinishedModule (upval), MemStorageService (upval), ConstantsModule (upval), p4 (copy), PromiseModule (upval), UtilsModule1 (upval), FFlagAXEditorSubcategoryFilters (upval), FFlagAXRefetchInventoryOnAssetGrant (upval), GetStaleInventoryGrantStoreFunction (upval), PerformFetch (upval), GetFFlagAXEnableNewInventoryItemsListModule (upval), fetchItems (upval), NetworkImpl (copy), FFlagAXPhotoboothIsStandalone (upval), GetFFlagAXEnableInventorySortsAndFiltersModule (upval), p5 (copy), FFlagAXTTIEditorEnableMilestones (upval), p6 (copy), MutedErrorModule (upval)
		if FFlagAXCustomizeBackgrounds and not FFlagAXBackgroundsCustomizeHydration and CategoryInfo.NavigationKey == AvatarEditorCategories.Backgrounds then
			Store:dispatch(SetPageFinishedModule(CategoryInfo.SearchUuid, true))
			MemStorageService:SetItem(CategoryInfo.SearchUuid, ConstantsModule.ReachedLastPage)
			
			if p4 then
				p4.addResultsPage({ avatarInventoryItems = {} })
			end
			return PromiseModule.resolve(ConstantsModule.ReachedLastPage)
		else
			local State = Store:getState()
			local SearchUuidAndAssetTypes = UtilsModule1.getSearchUuidAndAssetTypes(CategoryInfo, State.AvatarExperience.AvatarEditor.Categories.subButton, if FFlagAXEditorSubcategoryFilters then State.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil)
			
			if SearchUuidAndAssetTypes then
				local IsSearchUuidStale = if FFlagAXRefetchInventoryOnAssetGrant then GetStaleInventoryGrantStoreFunction().isSearchUuidStale(SearchUuidAndAssetTypes) else nil
				
				return PerformFetch.Single(if FFlagAXRefetchInventoryOnAssetGrant and IsSearchUuidStale then SearchUuidAndAssetTypes .. "-stale" else SearchUuidAndAssetTypes, function()
					-- upvalues: GetFFlagAXEnableNewInventoryItemsListModule (upval), p4 (upval), PromiseModule (upval), ConstantsModule (upval), SearchUuidAndAssetTypes (copy), MemStorageService (upval), FFlagAXRefetchInventoryOnAssetGrant (upval), IsSearchUuidStale (copy), fetchItems (upval), NetworkImpl (upval), CategoryInfo (upval), Store (copy), FFlagAXPhotoboothIsStandalone (upval), GetFFlagAXEnableInventorySortsAndFiltersModule (upval), p5 (upval), FFlagAXTTIEditorEnableMilestones (upval), p6 (upval)
					local Item = nil
					
					if GetFFlagAXEnableNewInventoryItemsListModule() and p4 then
						Item = p4.nextPageCursor
						
						if p4.getHasReachedLastPage(false) then
							return PromiseModule.resolve(ConstantsModule.ReachedLastPage)
						end
					else
						Item = if SearchUuidAndAssetTypes then MemStorageService:GetItem(SearchUuidAndAssetTypes) else nil
						
						if Item == ConstantsModule.ReachedLastPage then
							return PromiseModule.resolve(ConstantsModule.ReachedLastPage)
						end
					end
					local IsSearchUuidStale1 = if FFlagAXRefetchInventoryOnAssetGrant then Item == nil and IsSearchUuidStale else nil
					
					return PromiseModule.new(function(Resolve, Reject)
						-- upvalues: fetchItems (upval), NetworkImpl (upval), SearchUuidAndAssetTypes (upval), CategoryInfo (upval), Store (upval), Item (ref), GetFFlagAXEnableNewInventoryItemsListModule (upval), FFlagAXPhotoboothIsStandalone (upval), p4 (upval), GetFFlagAXEnableInventorySortsAndFiltersModule (upval), p5 (upval), FFlagAXTTIEditorEnableMilestones (upval), p6 (upval), FFlagAXRefetchInventoryOnAssetGrant (upval), IsSearchUuidStale1 (copy)
						fetchItems({
							networkImpl = NetworkImpl,
							searchUuid = SearchUuidAndAssetTypes,
							categoryInfo = CategoryInfo,
							store = Store,
							resolve = Resolve,
							reject = Reject,
							nextPageCursor = Item,
							categoryInventoryStore = if GetFFlagAXEnableNewInventoryItemsListModule() or FFlagAXPhotoboothIsStandalone then p4 else nil,
							sortAndFiltersStore = if GetFFlagAXEnableInventorySortsAndFiltersModule() then p5 else nil,
							trackTTI = if FFlagAXTTIEditorEnableMilestones then p6 else nil,
							isStaleCategoryRefetch = if FFlagAXRefetchInventoryOnAssetGrant then IsSearchUuidStale1 else nil
						})
					end)
				end)(Store):catch(function(Err)
					-- upvalues: MutedErrorModule (upval)
					MutedErrorModule("GetUserInventoryV2 fetch failed: ", Err)
				end)
			else
				return PromiseModule.resolve("No SearchUuid")
			end
		end
	end
end