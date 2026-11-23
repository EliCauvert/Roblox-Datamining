local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local AvatarAssetTypeMappingsModule = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings)
local InventoryPagesDataModule = require(AvatarWorkshop.Constants.InventoryPagesData)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)
local UseStartSaveAvatarFlowModule = require(AvatarWorkshop.Hooks.useStartSaveAvatarFlow)
local GetInventoryPageStoreModule = require(AvatarWorkshop.Stores.Getters.getInventoryPageStore)
local GetUiStateStoreModule = require(AvatarWorkshop.Stores.Getters.getUiStateStore)
local GetEquippedAssetIdsOfTypesModule = require(AvatarWorkshop.Utils.getEquippedAssetIdsOfTypes)
local GetOutfitKindModule = require(AvatarWorkshop.Utils.getOutfitKind)
local GetOutfitAvatarStateModule = require(AvatarWorkshop.Utils.getOutfitAvatarState)
local IsWearingOutfitModule = require(AvatarWorkshop.Utils.isWearingOutfit)
local PinEquippedItemsModule = require(AvatarWorkshop.Utils.pinEquippedItems)
local InventoryGridConstantsModule = require(script.Parent.InventoryGridConstants)
local _ = require(script.Parent.InventoryGridTypes)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = SignalsReactModule.useSignalState
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local AssetTypeFromId = AvatarAssetTypeMappingsModule.assetTypeFromId

local function doNothing() end

local function getPinnedAssets(p1, AssetTypes)
	-- upvalues: GetEquippedAssetIdsOfTypesModule (copy)
	local config = { ids = {}, assetTypes = {} }
	
	for _, assetType in AssetTypes do
		for _, value in GetEquippedAssetIdsOfTypesModule(p1, { assetType }) do
			table.insert(config.ids, value)
			config.assetTypes[value] = assetType
		end
	end
	return config
end

return function(p2)
	-- upvalues: UseTokensFunction (copy), GetInventoryPageStoreModule (copy), UseSignalStateFunction (copy), GetUiStateStoreModule (copy), GetAvatarStateStoreModule (copy), UseStartSaveAvatarFlowModule (copy), InventoryPagesDataModule (copy), ScreensModule (copy), ReactModule (copy), getPinnedAssets (copy), PinEquippedItemsModule (copy), InventoryGridConstantsModule (copy), doNothing (copy), GetOutfitKindModule (copy), IsWearingOutfitModule (copy), GetOutfitAvatarStateModule (copy), AssetTypeFromId (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local PageData = p2.pageData
	local AssetTypes = PageData.assetTypes
	local IsShowTitles = PageData.showTitles == true
	local UseTokensResult = UseTokensFunction()
	local InventoryPageStoreModule = GetInventoryPageStoreModule(PageData)
	local UseSignalStateResult = UseSignalStateFunction(GetUiStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(GetAvatarStateStoreModule)
	local UseSignalStateResult2 = UseSignalStateFunction(InventoryPageStoreModule.getEntries)
	local UseSignalStateResult3 = UseSignalStateFunction(InventoryPageStoreModule.getIsFetching)
	local UseSignalStateResult4 = UseSignalStateFunction(InventoryPageStoreModule.getDidInitialFetch)
	local UseSignalStateResult5 = UseSignalStateFunction(InventoryPageStoreModule.getHasLoadedPage)
	local UseSignalStateResult6 = UseSignalStateFunction(InventoryPageStoreModule.getHasFetchError)
	local UseSignalStateResult7 = UseSignalStateFunction(InventoryPageStoreModule.getLastPageReached)
	local UseSignalStateResult8 = UseSignalStateFunction(UseSignalStateResult.getLastMeasuredGridWidth)
	local UseSignalStateResult9 = UseSignalStateFunction(UseSignalStateResult1.getEquippedAssetIds)
	local UseSignalStateResult10 = UseSignalStateFunction(UseSignalStateResult1.getAvatarState)
	local FetchNextPageFunction = InventoryPageStoreModule.fetchNextPage
	local UseStartSaveAvatarFlowModuleResult = UseStartSaveAvatarFlowModule()
	local IsPageDataMatch = PageData == InventoryPagesDataModule[ScreensModule.Inventory.Avatars]
	local v1 = #UseSignalStateResult2 > 0
	ReactModule.useEffect(function()
		-- upvalues: v1 (copy), UseSignalStateResult3 (copy), UseSignalStateResult6 (copy), UseSignalStateResult7 (copy), FetchNextPageFunction (copy)
		if not v1 and not UseSignalStateResult3 and not UseSignalStateResult6 and not UseSignalStateResult7 then
			FetchNextPageFunction()
		end
	end, {
		v1,
		UseSignalStateResult3,
		UseSignalStateResult6,
		UseSignalStateResult7,
		FetchNextPageFunction
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: AssetTypes (copy), UseSignalStateResult10 (copy), getPinnedAssets (upval)
		return if AssetTypes and UseSignalStateResult10 then getPinnedAssets(UseSignalStateResult10, AssetTypes) else nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), AssetTypes (copy), UseSignalStateResult10 (copy), UseStateResult2 (copy), getPinnedAssets (upval)
		if UseStateResult == nil and AssetTypes and UseSignalStateResult10 then
			UseStateResult2((getPinnedAssets(UseSignalStateResult10, AssetTypes)))
		end
	end, { UseStateResult, AssetTypes, UseSignalStateResult10 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), PinEquippedItemsModule (upval), UseSignalStateResult2 (copy)
		return if UseStateResult then PinEquippedItemsModule(UseSignalStateResult2, UseStateResult.ids) else UseSignalStateResult2
	end, { UseSignalStateResult2, UseStateResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), IsPageDataMatch (copy), InventoryGridConstantsModule (upval), UseStartSaveAvatarFlowModuleResult (copy), InventoryPageStoreModule (copy), doNothing (upval), GetOutfitKindModule (upval), UseSignalStateResult10 (copy), IsWearingOutfitModule (upval), GetOutfitAvatarStateModule (upval), UseSignalStateResult1 (copy), AssetTypeFromId (upval), UseStateResult (copy), UseSignalStateResult9 (copy), GetRbxThumbFunction (upval), ThumbnailType (upval), ThumbnailSize (upval), IsShowTitles (copy)
		local Buffer = table.create(#UseMemoResult + (if IsPageDataMatch then 1 else 0))
		
		if IsPageDataMatch then
			table.insert(Buffer, {
				image = "",
				isSelected = false,
				id = InventoryGridConstantsModule.ADD_NEW_ITEM_ID,
				onActivated = function()
					-- upvalues: UseStartSaveAvatarFlowModuleResult (upval)
					UseStartSaveAvatarFlowModuleResult()
				end
			})
		end
		for _, value in UseMemoResult do
			local ItemId = value.itemId
			local Item = InventoryPageStoreModule.getItem(value)
			local IsSelected = false
			local OnActivated: () -> () = doNothing
			
			if value.itemType == "Outfit" then
				local OutfitDetail = if Item then Item.outfitDetail else nil
				
				if Item and OutfitDetail then
					local OutfitKindModule = GetOutfitKindModule(Item.itemCategory.itemSubType, OutfitDetail)
					IsSelected = UseSignalStateResult10 ~= nil and IsWearingOutfitModule(GetOutfitAvatarStateModule(ItemId, OutfitDetail), OutfitKindModule, UseSignalStateResult10)
					
					OnActivated = function()
						-- upvalues: UseSignalStateResult1 (upval), OutfitDetail (copy), OutfitKindModule (copy)
						UseSignalStateResult1.toggleOutfit(OutfitDetail, OutfitKindModule)
					end
				end
			else
				local Number: number? = tonumber(ItemId)
				local AssetTypeFromIdEntry = if Item then AssetTypeFromId[Item.itemCategory.itemSubType] elseif UseStateResult then UseStateResult.assetTypes[ItemId] else nil
				
				if Number and AssetTypeFromIdEntry then
					IsSelected = UseSignalStateResult9[Number] == true
					
					OnActivated = function()
						-- upvalues: UseSignalStateResult1 (upval), Number (copy), AssetTypeFromIdEntry (copy)
						UseSignalStateResult1.toggleAsset(Number, AssetTypeFromIdEntry)
					end
				end
			end
			table.insert(Buffer, {
				id = ItemId,
				image = if value.itemType == "Outfit" then GetRbxThumbFunction(ThumbnailType.Outfit, ItemId, ThumbnailSize.Medium) else GetRbxThumbFunction(ThumbnailType.Asset, ItemId, ThumbnailSize.Medium),
				title = if IsShowTitles and Item then Item.itemName else nil,
				isSelected = IsSelected,
				onActivated = OnActivated
			})
		end
		return Buffer
	end, {
		UseMemoResult, UseStateResult, InventoryPageStoreModule, UseSignalStateResult1,
		UseSignalStateResult9, UseSignalStateResult10, IsPageDataMatch,
		UseStartSaveAvatarFlowModuleResult, IsShowTitles
	})
	local V44 = v1 or IsPageDataMatch and UseSignalStateResult5
	
	return {
		fallbackNumColumns = 5,
		minColumns = 3,
		items = UseMemoResult1,
		tileShape = PageData.tileShape or "Square",
		isLoadingInitialPage = if UseSignalStateResult3 then not V44 else IsPageDataMatch and (not UseSignalStateResult4 and (not UseSignalStateResult6 and not V44)),
		isLoadingNextPage = UseSignalStateResult3 and V44,
		isEmpty = UseSignalStateResult4 and (UseSignalStateResult7 and (not UseSignalStateResult3 and (not UseSignalStateResult6 and not (#UseMemoResult1 > 0)))),
		hasFetchError = UseSignalStateResult6 and not V44,
		hasNextPageError = UseSignalStateResult6 and V44,
		minItemWidth = UseTokensResult.Size.Size_2000,
		lastMeasuredGridWidth = UseSignalStateResult8,
		onGridWidthChanged = UseSignalStateResult.setLastMeasuredGridWidth,
		rowGap = UseTokensResult.Gap.Medium,
		columnGap = UseTokensResult.Gap.Medium,
		contentPaddingY = UseTokensResult.Padding.Large,
		onEndReached = if UseSignalStateResult6 then nil else FetchNextPageFunction,
		onRetry = FetchNextPageFunction
	}
end