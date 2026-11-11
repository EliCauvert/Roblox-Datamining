local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local TutilsModule = require(CorePackages.Packages.tutils)
local _ = require(Modules.AvatarExperience.Common.Types)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXAddHDRowInItemDetailsPage = AvatarExperienceFlagsModule.FFlagAXAddHDRowInItemDetailsPage
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local AXFixTimedOptionsDuplicateAppend = game:DefineFastFlag("AXFixTimedOptionsDuplicateAppend", false)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ModelsUtils = {
	CreateRestrictionInfo = function(ItemRestrictions)
		-- upvalues: CryoModule (copy), CatalogConstantsModule (copy), ItemTileEnums (copy)
		if ItemRestrictions then
			local Set = CryoModule.List.toSet(ItemRestrictions)
			local SetEntry = Set[CatalogConstantsModule.ItemRestrictions.Limited]
			local SetEntry1 = Set[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
			local SetEntry2 = Set[CatalogConstantsModule.ItemRestrictions.Collectible]
			
			return Set, if SetEntry or SetEntry1 or SetEntry2 then {
				[ItemTileEnums.Restriction.Limited] = SetEntry,
				[ItemTileEnums.Restriction.LimitedUnique] = SetEntry1,
				[ItemTileEnums.Restriction.Collectible] = SetEntry2
			} else nil
		else
			return nil, nil
		end
	end
}

function ModelsUtils.itemDataFromAssetInfo(p1, p2)
	-- upvalues: TutilsModule (copy), ModelsUtils (copy), AXFixTimedOptionsDuplicateAppend (copy), FFlagAXShowFaeUpsell (copy), CryoModule (copy), DashModule (copy), FFlagAXAddHDRowInItemDetailsPage (copy)
	local DeepCopyResult = TutilsModule.deepCopy(if p2 then p2 else {})
	local RestrictionInfo, RestrictionInfo2 = ModelsUtils.CreateRestrictionInfo(p1.itemRestrictions)
	local Config = if p1.productId then { id = tostring(p1.productId) } else nil
	local Config1 = if p1.creatorTargetId then {
		id = tostring(p1.creatorTargetId),
		name = p1.creatorName,
		type = p1.creatorType,
		hasVerifiedBadge = p1.creatorHasVerifiedBadge
	} else nil
	local List = nil
	
	if p1.timedOptions then
		List = p1.timedOptions
		local Flag = not AXFixTimedOptionsDuplicateAppend and nil
		local Flag1 = false
		
		for _, value in List do
			if AXFixTimedOptionsDuplicateAppend and value.days == 0 then
				Flag = true
			end
			if value.selected then
				Flag1 = true
			end
		end
		if AXFixTimedOptionsDuplicateAppend then
			if not Flag then
				table.insert(List, { days = 0, price = p1.price, selected = not Flag1 or nil })
			end
		else
			table.insert(List, { days = 0, price = p1.price, selected = not Flag1 or nil })
		end
	end
	local T = if FFlagAXShowFaeUpsell then {} else nil
	
	if FFlagAXShowFaeUpsell and (DeepCopyResult.itemStatus or p1.itemStatus) then
		local t = {}
		local JoinFunction = CryoModule.List.join
		local ItemStatus = DeepCopyResult.itemStatus or {}
		local ItemStatus1 = p1.itemStatus or {}
		for _, value1 in JoinFunction(ItemStatus, ItemStatus1) do
			if not t[value1] then
				t[value1] = true
				table.insert(T, value1)
			end
		end
	end
	return (DashModule.join(DeepCopyResult, {
		id = if p1.id then tostring(p1.id) else nil,
		assetType = if p1.assetType then tostring(p1.assetType) else nil,
		name = p1.name,
		description = p1.description,
		product = Config,
		genres = p1.genres,
		creator = Config1,
		priceInRobux = p1.price,
		lowestPrice = p1.lowestPrice,
		lowestResalePrice = p1.lowestResalePrice,
		favoriteCount = p1.favoriteCount,
		discountInformation = p1.discountInformation,
		itemStatus = if FFlagAXShowFaeUpsell then T else p1.itemStatus,
		itemRestrictions = RestrictionInfo,
		tileRestrictionsMap = RestrictionInfo2,
		priceStatus = p1.priceStatus,
		numberRobloxHasAvailable = p1.unitsAvailableForConsumption or p1.numberRobloxHasAvailable,
		totalQuantity = p1.totalQuantity,
		isForRent = p1.isForRent,
		isOwned = p1.owned,
		isPurchasable = p1.isPurchasable,
		expectedSellerId = if p1.expectedSellerId then tostring(p1.expectedSellerId) else nil,
		premiumPricing = p1.premiumPricing,
		collectibleItemId = p1.collectibleItemId,
		saleLocationType = p1.saleLocationType,
		hasResellers = p1.hasResellers,
		isOffSale = p1.isOffSale,
		isHighDefinition = if FFlagAXAddHDRowInItemDetailsPage then p1.isHighDefinition else nil,
		isPBR = p1.isPBR,
		variantAttributes = p1.variantAttributes,
		timedOptions = List,
		creatingUniverseId = if p1.creatingUniverseId then tostring(p1.creatingUniverseId) else nil,
		taxonomy = p1.taxonomy
	}))
end

function ModelsUtils.itemDataFromBundleInfo(p3, BundleType, p4)
	-- upvalues: TutilsModule (copy), FFlagAXMISEnableMultiShopping (copy), ModelsUtils (copy), CryoModule (copy), DashModule (copy), FFlagAXAddHDRowInItemDetailsPage (copy)
	local DeepCopyResult = TutilsModule.deepCopy(if p4 then p4 else {})
	local t = {}
	
	if FFlagAXMISEnableMultiShopping and DeepCopyResult.items then
		for _, item in DeepCopyResult.items do
			t[item.id] = item
		end
	end
	local RestrictionInfo, RestrictionInfo2 = ModelsUtils.CreateRestrictionInfo(p3.itemRestrictions)
	local Config = if p3.productId then { id = tostring(p3.productId) } else nil
	local Config1 = if p3.creatorTargetId then {
		id = tostring(p3.creatorTargetId),
		name = p3.creatorName,
		type = p3.creatorType,
		hasVerifiedBadge = p3.creatorHasVerifiedBadge
	} else nil
	local List = nil
	
	if p3.bundledItems then
		List = {}
		
		for _, bundledItem in p3.bundledItems do
			local JoinResult = {
				id = tostring(bundledItem.id),
				assetType = if bundledItem.assetType then tostring(bundledItem.assetType) else nil,
				type = bundledItem.type
			}
			
			if FFlagAXMISEnableMultiShopping then
				local Entry = t[tostring(bundledItem.id)]
				
				if Entry then
					JoinResult = CryoModule.Dictionary.join(Entry, JoinResult)
				end
			end
			table.insert(List, JoinResult)
		end
	end
	return (DashModule.join(DeepCopyResult, {
		id = if p3.id then tostring(p3.id) else nil,
		itemType = p3.itemType,
		bundleType = BundleType,
		name = p3.name,
		description = p3.description,
		product = Config,
		genres = p3.genres,
		creator = Config1,
		priceInRobux = p3.price,
		favoriteCount = p3.favoriteCount,
		discountInformation = p3.discountInformation,
		itemStatus = p3.itemStatus,
		itemRestrictions = RestrictionInfo,
		tileRestrictionsMap = RestrictionInfo2,
		lowestPrice = p3.lowestPrice,
		lowestResalePrice = p3.lowestResalePrice,
		priceStatus = p3.priceStatus,
		numberRobloxHasAvailable = p3.unitsAvailableForConsumption or p3.numberRobloxHasAvailable,
		isForRent = p3.isForRent,
		isOwned = p3.owned,
		isPurchasable = p3.isPurchasable,
		expectedSellerId = if p3.expectedSellerId then tostring(p3.expectedSellerId) else nil,
		items = List,
		totalQuantity = p3.totalQuantity,
		premiumPricing = p3.premiumPricing,
		collectibleItemId = p3.collectibleItemId,
		saleLocationType = p3.saleLocationType,
		hasResellers = p3.hasResellers,
		isOffSale = p3.isOffSale,
		isRecolorable = p3.isRecolorable,
		isHighDefinition = if FFlagAXAddHDRowInItemDetailsPage then p3.isHighDefinition else nil,
		isPBR = p3.isPBR,
		taxonomy = p3.taxonomy
	}))
end

return ModelsUtils