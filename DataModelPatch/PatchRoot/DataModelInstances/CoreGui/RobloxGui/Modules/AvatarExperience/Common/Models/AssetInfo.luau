local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local GenerateStringIdFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GenerateStringId
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ModelsUtilsModule = require(script.Parent.ModelsUtils)
local FixEmptyLimitedBadges = game:DefineFastFlag("FixEmptyLimitedBadges", false)
local FFlagAXDurablesSupportForRFYMigration = AvatarExperienceFlagsModule.FFlagAXDurablesSupportForRFYMigration
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local FFlagAXFixRecommendedItemCreatorType = AvatarExperienceFlagsModule.FFlagAXFixRecommendedItemCreatorType
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local FFlagAXFixWidgetHydrationPermanentPrice = AvatarExperienceFlagsModule.FFlagAXFixWidgetHydrationPermanentPrice

return {
	mock = function()
		-- upvalues: ConstantsModule (copy), GenerateStringIdFunction (copy)
		return {
			receivedCatalogData = false,
			receivedRecommendedData = false,
			receivedFromRecommendedData = false,
			receivedFromBundleItemData = false,
			receivedFromInventoryFetch = false,
			receivedFromOutfitDetails = false,
			receivedFromResaleData = false,
			receivedFromVersionData = false,
			name = "",
			description = "",
			creatorName = "",
			assetType = ConstantsModule.AssetTypeIdStrings.Hat,
			id = GenerateStringIdFunction(),
			priceInRobux = 1,
			creator = {
				name = "",
				type = "",
				targetId = "",
				hasVerifiedBadge = false,
				id = GenerateStringIdFunction()
			},
			created = "",
			updated = "",
			genres = {},
			minimumMembershipLevel = 0,
			product = {
				type = "",
				isForSale = true,
				id = GenerateStringIdFunction()
			},
			recommendedItemSummaries = {},
			favoriteCount = 0,
			priceStatus = "",
			itemRestrictions = {},
			itemStatus = {},
			lowestPrice = nil,
			numberRobloxHasAvailable = nil,
			totalQuantity = nil,
			resellerUserAssetIds = {},
			soldCount = 0,
			averagePrice = 0,
			originalPrice = 0,
			isForRent = false,
			isOwned = false,
			supportsHeadShapes = false,
			isPurchasable = false,
			expectedSellerId = GenerateStringIdFunction(),
			creatingUniverseId = nil,
			collectibleItemId = "0",
			moderationStatus = nil
		}
	end,
	fromRecommendedItemSummaries = function(RecommendedItemSummaries, p1)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p1 then p1 else {})
		DeepCopyResult.receivedRecommendedData = true
		DeepCopyResult.recommendedItemSummaries = RecommendedItemSummaries
		
		return DeepCopyResult
	end,
	fromGetRecommendedItemsDataV2 = function(p1, AssetType, p2)
		-- upvalues: ModelsUtilsModule (copy)
		local ItemDataFromAssetInfoResult = ModelsUtilsModule.itemDataFromAssetInfo(p1, p2)
		ItemDataFromAssetInfoResult.receivedFromRecommendedData = true
		
		if AssetType then
			ItemDataFromAssetInfoResult.assetType = AssetType
		end
		return ItemDataFromAssetInfoResult
	end,
	fromHydrateWidgetInfo = function(p1, p2)
		-- upvalues: TutilsModule (copy), ConstantsModule (copy), FFlagAXShowFaeUpsell (copy), FixEmptyLimitedBadges (copy), ItemTileEnums (copy), FFlagAXDurablesSupportForRFYMigration (copy), FFlagAXFixWidgetHydrationPermanentPrice (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p2 then p2 else {})
		DeepCopyResult.id = tostring(p1.id)
		
		if p1.failedToHydrate then
			DeepCopyResult.failedToHydrate = true
			
			return DeepCopyResult
		end
		DeepCopyResult.name = p1.name
		DeepCopyResult.creator = {
			name = if p1.creator then p1.creator.name else p1.creatorName,
			hasVerifiedBadge = if p1.creator then p1.creator.hasVerifiedBadge else nil
		}
		DeepCopyResult.assetType = ConstantsModule.AssetTypeIdStrings[tostring(p1.assetType)]
		DeepCopyResult.priceInRobux = p1.price
		DeepCopyResult.priceStatus = if FFlagAXShowFaeUpsell then p1.priceStatus else nil
		DeepCopyResult.receivedWidgetHydration = true
		DeepCopyResult.tileRestrictionsMap = if p1.isLimited or p1.isLimitedUnique or p1.isCollectible then {
			[ItemTileEnums.Restriction.Limited] = if p1.isLimited then true else false,
			[ItemTileEnums.Restriction.LimitedUnique] = if p1.isLimitedUnique then true else false,
			[ItemTileEnums.Restriction.Collectible] = if p1.isCollectible then true else false
		} elseif FixEmptyLimitedBadges then nil else {}
		
		if FFlagAXShowFaeUpsell and p1.itemStatus then
			DeepCopyResult.itemStatus = p1.itemStatus
		end
		if FFlagAXDurablesSupportForRFYMigration and p1.timedOptions then
			local List = {}
			
			for _, timedOption in p1.timedOptions do
				table.insert(List, {
					days = timedOption.days,
					price = timedOption.price,
					selected = timedOption.selected
				})
			end
			if FFlagAXFixWidgetHydrationPermanentPrice then
				local Flag = false
				local Flag1 = false
				
				for _, value in List do
					if value.selected then
						Flag = true
					end
					if value.days == 0 then
						Flag1 = true
					end
					if Flag and Flag1 then break end
				end
				if not Flag1 then
					table.insert(List, { days = 0, price = p1.price, selected = not Flag or nil })
				end
			end
			DeepCopyResult.timedOptions = List
		end
		return DeepCopyResult
	end,
	fromGetRecommendedItemsData = function(p3, AssetType, p4)
		-- upvalues: TutilsModule (copy), FFlagAXFixRecommendedItemCreatorType (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p4 then p4 else {})
		DeepCopyResult.receivedFromRecommendedData = true
		
		if p3.item then
			DeepCopyResult.name = p3.item.name
			DeepCopyResult.id = tostring(p3.item.assetId)
			DeepCopyResult.priceInRobux = p3.item.price
		end
		if p3.product and p3.product.isFree then
			DeepCopyResult.priceInRobux = 0
		end
		if p3.product then
			DeepCopyResult.product = { id = tostring(p3.product.id) }
		end
		if p3.creator then
			DeepCopyResult.creator = {
				id = tostring(p3.creator.creatorId),
				name = p3.creator.name,
				type = if FFlagAXFixRecommendedItemCreatorType then p3.creator.creatorType else p3.creator.type
			}
		end
		if AssetType then
			DeepCopyResult.assetType = AssetType
		end
		return DeepCopyResult
	end,
	fromGetCatalogItemData = function(p3, p4)
		-- upvalues: ModelsUtilsModule (copy), FFlagAXInventoryDurablesExpiredFilter (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXMISEnableMultiShopping (copy), ConstantsModule (copy)
		local ItemDataFromAssetInfoResult = ModelsUtilsModule.itemDataFromAssetInfo(p3, p4)
		
		if not FFlagAXInventoryDurablesExpiredFilter or not p3.skipReceivedCatalogData then
			ItemDataFromAssetInfoResult.receivedCatalogData = true
		end
		if p3.timedOptions then
			local TimedOptions = {}
			
			for _, timedOption in p3.timedOptions do
				table.insert(TimedOptions, {
					days = timedOption.days,
					price = timedOption.price,
					discountInformation = if timedOption.days == 0 then p3.discountInformation else timedOption.discountInformation,
					selected = timedOption.selected
				})
			end
			ItemDataFromAssetInfoResult.timedOptions = TimedOptions
		end
		if FFlagAXInventoryDurablesSupport then
			ItemDataFromAssetInfoResult.expirationTime = p3.expirationTime
		end
		if FFlagAXMISEnableMultiShopping then
			ItemDataFromAssetInfoResult.assetType = if tonumber(p3.assetType) then tostring(p3.assetType) else ConstantsModule.AssetTypeIdStrings[tostring(p3.assetType)]
			
			return ItemDataFromAssetInfoResult
		end
		ItemDataFromAssetInfoResult.assetType = ConstantsModule.AssetTypeIdStrings[tostring(p3.assetType)]
		
		if ItemDataFromAssetInfoResult.assetType == nil and p3.assetType ~= nil then
			ItemDataFromAssetInfoResult.assetType = tostring(p3.assetType)
		end
		return ItemDataFromAssetInfoResult
	end,
	fromBundleItemData = function(Creator, p5)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		DeepCopyResult.receivedFromBundleItemData = true
		DeepCopyResult.id = tostring(Creator.id)
		DeepCopyResult.name = Creator.name
		DeepCopyResult.isOwned = Creator.owned
		
		return DeepCopyResult
	end,
	fromSortResults = function(p5, p6)
		-- upvalues: ModelsUtilsModule (copy)
		local ItemDataFromAssetInfoResult = ModelsUtilsModule.itemDataFromAssetInfo(p5, p6)
		ItemDataFromAssetInfoResult.receivedFromSortResults = true
		
		return ItemDataFromAssetInfoResult
	end,
	fromBundledItems = function(p5, p6)
		-- upvalues: ModelsUtilsModule (copy)
		return ModelsUtilsModule.itemDataFromAssetInfo(p5, p6)
	end,
	fromInventoryFetch = function(p5, p6)
		-- upvalues: TutilsModule (copy), ConstantsModule (copy), FFlagAXInventoryDurablesSupport (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p6 then p6 else {})
		DeepCopyResult.receivedFromInventoryFetch = true
		DeepCopyResult.id = tostring(p5.assetId)
		DeepCopyResult.name = p5.name
		DeepCopyResult.assetType = ConstantsModule.AssetTypeIdStrings[p5.assetType]
		
		if p5.moderationStatus then
			DeepCopyResult.moderationStatus = p5.moderationStatus
		end
		if p5.creatingUniverseId then
			DeepCopyResult.creatingUniverseId = p5.creatingUniverseId
		end
		if FFlagAXInventoryDurablesSupport and p5.expirationTime then
			DeepCopyResult.expirationTime = p5.expirationTime
		end
		return DeepCopyResult
	end,
	fromAssetGrant = function(Id, AssetType, p5)
		-- upvalues: TutilsModule (copy), ArgCheckModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		ArgCheckModule.isType(Id, "string", "AssetInfo.fromAssetGrant expects assetId to be a string")
		ArgCheckModule.isType(AssetType, "string", "AssetInfo.fromAssetGrant expects assetType to be a string")
		DeepCopyResult.id = Id
		DeepCopyResult.assetType = AssetType
		DeepCopyResult.moderationStatus = Enum.ModerationStatus.NotReviewed
		
		return DeepCopyResult
	end,
	fromModerationStatusUpdate = function(ModerationStatus, UpdateCounter, Id, Name, CreatingUniverseId, p5)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		DeepCopyResult.moderationStatus = ModerationStatus
		DeepCopyResult.updateCounter = UpdateCounter
		DeepCopyResult.id = Id
		DeepCopyResult.name = Name
		DeepCopyResult.creatingUniverseId = CreatingUniverseId
		
		return DeepCopyResult
	end,
	fromOutfitDetails = function(Creator, p5, OutfitModerationStatus)
		-- upvalues: TutilsModule (copy), FFlagDynamicHeadsMigration (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		DeepCopyResult.receivedFromOutfitDetails = true
		DeepCopyResult.id = tostring(Creator.id)
		DeepCopyResult.name = Creator.name
		DeepCopyResult.assetType = tostring(Creator.assetType.id)
		DeepCopyResult.outfitModerationStatus = OutfitModerationStatus
		
		if FFlagDynamicHeadsMigration and Creator.supportsHeadShapes ~= nil then
			DeepCopyResult.supportsHeadShapes = Creator.supportsHeadShapes
		end
		return DeepCopyResult
	end,
	fromGetResellers = function(ResellerUserAssetIds, p5)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		DeepCopyResult.resellerUserAssetIds = ResellerUserAssetIds
		
		return DeepCopyResult
	end,
	fromLowestPrice = function(LowestPrice, p5)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		DeepCopyResult.lowestPrice = LowestPrice
		
		return DeepCopyResult
	end,
	fromResaleData = function(p5, p6)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p6 then p6 else {})
		DeepCopyResult.receivedFromResaleData = true
		DeepCopyResult.soldCount = p5.sales
		DeepCopyResult.averagePrice = p5.recentAveragePrice
		DeepCopyResult.originalPrice = p5.originalPrice
		
		return DeepCopyResult
	end,
	fromIsOwned = function(IsOwned, p5)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p5 then p5 else {})
		DeepCopyResult.isOwned = IsOwned
		
		return DeepCopyResult
	end,
	fromReceivedAvatarData = function(Creator)
		return {
			id = tostring(Creator.id),
			name = Creator.name,
			assetType = tostring(Creator.assetType.id)
		}
	end,
	fromVersionData = function(p5, p6)
		-- upvalues: TutilsModule (copy)
		local DeepCopyResult = TutilsModule.deepCopy(if p6 then p6 else {})
		local Entry = p5.data[1]
		DeepCopyResult.receivedFromVersionData = true
		DeepCopyResult.creatingUniverseId = if Entry.creatingUniverseId then tostring(Entry.creatingUniverseId) else nil
		
		return DeepCopyResult
	end
}