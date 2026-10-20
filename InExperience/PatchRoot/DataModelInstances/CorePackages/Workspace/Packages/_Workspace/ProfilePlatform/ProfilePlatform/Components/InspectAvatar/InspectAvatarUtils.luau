local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Common.AssetInfo)
local _ = require(Parent.CatalogNetworking)
local AvatarExperienceInspectAndBuyModule = require(Parent.AvatarExperienceInspectAndBuy)
local GetPriceStatusInShopFunction = AvatarExperienceInspectAndBuyModule.Utils.getPriceStatusInShop
local PriceStatus = AvatarExperienceInspectAndBuyModule.Enums.PriceStatus
local _ = require(ProfilePlatform.Common.Types)
local SalesLocationType = require(Parent.AvatarExperienceCommon).Enums.SalesLocationType
local config = {
	[61] = true,
	[60] = true,
	[55] = true,
	[56] = true,
	[57] = true,
	[58] = true,
	[59] = true,
	[48] = true,
	[9] = true
}
local t = {}

for _, enumItem in Enum.AvatarAssetType:GetEnumItems() do
	if not config[enumItem.Value] then
		t[enumItem.Value] = true
	end
end
local function _(p1)
	-- upvalues: SalesLocationType (copy)
	return if p1.saleLocationType == SalesLocationType.ShopOnly then SalesLocationType.ShopAndAllExperiences else p1.saleLocationType
end

local _ = function(p1, p2, p3)
	return if p2 and p2.quantityOwned ~= nil then p2.quantityOwned > 0 elseif p3 == nil then p1.owned == true else p3
end

local _ = function(p1)
	local ItemRestrictions = p1.itemRestrictions
	
	if not ItemRestrictions or #ItemRestrictions == 0 then
		return nil
	end
	local t = {}
	
	for _, itemRestriction in ItemRestrictions do
		t[itemRestriction] = true
	end
	return t
end

local function buildCollectibleItemDetails(p2, p3, CollectibleLowestAvailableResaleProductId)
	local HasResellers = p2.hasResellers or (p2.unitsAvailableForConsumption or (p2.totalQuantity or (p2.lowestResalePrice or p3 and p3.quantityOwned)))
	
	return if HasResellers then {
		hasResellers = p2.hasResellers,
		unitsAvailableForConsumption = p2.unitsAvailableForConsumption,
		totalQuantity = p2.totalQuantity,
		lowestResalePrice = p2.lowestResalePrice,
		resellableCount = if p3 then p3.quantityOwned else nil,
		collectibleLowestAvailableResaleProductId = CollectibleLowestAvailableResaleProductId
	} else nil
end

local function buildAssetsInBundle(p2, p3)
	local v1 = nil
	
	if p3 and p3.assetsInBundle then
		local List = {}
		
		for _, value in p3.assetsInBundle do
			table.insert(List, {
				id = tostring(value.id),
				assetType = tostring(value.assetType),
				isIncluded = value.isIncluded
			})
		end
		v1 = List
		
		return v1
	else
		if p2.bundledItems then
			local List = {}
			
			for _, bundledItem in p2.bundledItems do
				if bundledItem.type == "Asset" and bundledItem.assetType then
					table.insert(List, {
						id = tostring(bundledItem.id),
						assetType = tostring(bundledItem.assetType)
					})
				end
			end
			if #List > 0 then
				v1 = List
			end
		end
		return v1
	end
end

local function computeBundleParts(p4, p5, p6)
	-- upvalues: t (copy)
	local Count = 0
	local Ids = {}
	
	if p5 and p5.assetsInBundle then
		for _, value in p5.assetsInBundle do
			if p6[tostring(value.id)] then
				Count += 1
				
				if t[value.assetType] == true then
					table.insert(Ids, value.id)
				end
			end
		end
		return Count, Ids
	else
		if p4.bundledItems then
			for _, bundledItem in p4.bundledItems do
				if bundledItem.type == "Asset" then
					Count += 1
					
					if bundledItem.assetType and t[bundledItem.assetType] == true then
						table.insert(Ids, bundledItem.id)
					end
				end
			end
		end
		return Count, Ids
	end
end

local _ = function(p7)
	return if p7.taxonomy and #p7.taxonomy > 0 then p7.taxonomy[1].taxonomyName else nil
end

return {
	isWearableAssetType = function(p7): boolean
		-- upvalues: t (copy)
		return t[p7] == true
	end,
	expandBundleToAssetIds = function(p7)
		local Ids = {}
		
		if p7.bundledItems then
			for _, bundledItem in p7.bundledItems do
				if bundledItem.type == "Asset" then
					table.insert(Ids, bundledItem.id)
				end
			end
		end
		return Ids
	end,
	collectBundleComponentIds = function(List, p8)
		local t = {}
		
		for _, value in List do
			local v2 = p8[value]
			
			if v2 and v2.assetsInBundle then
				for _, value1 in v2.assetsInBundle do
					t[tostring(value1.id)] = true
				end
			end
		end
		return t
	end,
	buildItemData = function(p9, p10, p11, p12, p13, CollectibleLowestAvailableResaleProductId)
		-- upvalues: computeBundleParts (copy), SalesLocationType (copy), buildCollectibleItemDetails (copy), buildAssetsInBundle (copy)
		local AssetType = p9.assetType or p9.bundleType
		local BundleParts, BundleParts2 = computeBundleParts(p9, p10, p11)
		local config = {
			id = tostring(p9.id),
			name = p9.name,
			itemType = p9.itemType or "Asset",
			itemSubType = if AssetType then tostring(AssetType) else nil,
			priceInRobux = p9.price,
			creator = {
				creatorId = tostring(p9.creatorTargetId or ""),
				creatorName = p9.creatorName,
				creatorHasVerifiedBadge = p9.creatorHasVerifiedBadge
			},
			saleLocationType = if p9.saleLocationType == SalesLocationType.ShopOnly then SalesLocationType.ShopAndAllExperiences else p9.saleLocationType,
			isOffSale = p9.isOffSale,
			isOwned = if p10 and p10.quantityOwned ~= nil then p10.quantityOwned > 0 elseif p13 == nil then p9.owned == true else p13,
			noPriceStatus = if p10 then p10.noPriceStatus else nil,
			catalogPriceStatus = p9.priceStatus,
			collectibleItemId = p9.collectibleItemId
		}
		local ItemRestrictions = p9.itemRestrictions
		local ItemRestrictions1 = nil
		
		if ItemRestrictions and #ItemRestrictions ~= 0 then
			local t = {}
			
			for _, itemRestriction in ItemRestrictions do
				t[itemRestriction] = true
			end
			ItemRestrictions1 = t
		else
			ItemRestrictions1 = nil
		end
		config.itemRestrictions = ItemRestrictions1
		config.collectibleItemDetails = buildCollectibleItemDetails(p9, p10, CollectibleLowestAvailableResaleProductId)
		config.assetsInBundle = buildAssetsInBundle(p9, p10)
		config.collectibleProductId = if p10 then p10.collectibleProductId else p12
		config.bundlePartsCount = BundleParts
		config.bundleAssetIds = BundleParts2
		config.taxonomyName = if p9.taxonomy and #p9.taxonomy > 0 then p9.taxonomy[1].taxonomyName else nil
		
		return config
	end,
	isPurchasableStatus = function(Free): boolean
		-- upvalues: PriceStatus (copy)
		return Free == PriceStatus.Free or (Free == PriceStatus.PurchaseFromRoblox or Free == PriceStatus.PurchaseFromResale)
	end,
	isItemPurchasable = function(p14): boolean
		-- upvalues: GetPriceStatusInShopFunction (copy), PriceStatus (copy)
		if p14.isOwned then
			return false
		else
			local PriceStatusInShop = GetPriceStatusInShopFunction(p14)
			
			return (PriceStatusInShop == PriceStatus.Free or (PriceStatusInShop == PriceStatus.PurchaseFromRoblox or PriceStatusInShop == PriceStatus.PurchaseFromResale)) and p14.collectibleProductId ~= nil
		end
	end,
	getEffectivePrice = function(p14)
		-- upvalues: GetPriceStatusInShopFunction (copy), PriceStatus (copy)
		return (if GetPriceStatusInShopFunction(p14) == PriceStatus.PurchaseFromResale then p14.collectibleItemDetails and p14.collectibleItemDetails.lowestResalePrice else p14.priceInRobux) or 0
	end,
	sortDisplayItems = function(List)
		-- upvalues: GetPriceStatusInShopFunction (copy), PriceStatus (copy)
		table.sort(List, function(A, B): boolean
			-- upvalues: GetPriceStatusInShopFunction (upval), PriceStatus (upval)
			local function _(p14): number
				-- upvalues: GetPriceStatusInShopFunction (upval), PriceStatus (upval)
				local PriceStatusInShop = GetPriceStatusInShopFunction(p14)
				local IsPriceStatusInShopMatch: boolean = PriceStatusInShop == PriceStatus.Free or (PriceStatusInShop == PriceStatus.PurchaseFromRoblox or PriceStatusInShop == PriceStatus.PurchaseFromResale)
				
				return if IsPriceStatusInShopMatch then 0 elseif PriceStatusInShop == PriceStatus.Owned or PriceStatusInShop == PriceStatus.QuantityLimitReached then 1 else 2
			end
			
			local PriceStatusInShop = GetPriceStatusInShopFunction(A)
			local IsPriceStatusInShopMatch: boolean = PriceStatusInShop == PriceStatus.Free or (PriceStatusInShop == PriceStatus.PurchaseFromRoblox or PriceStatusInShop == PriceStatus.PurchaseFromResale)
			local v3: number = if IsPriceStatusInShopMatch then 0 elseif PriceStatusInShop == PriceStatus.Owned or PriceStatusInShop == PriceStatus.QuantityLimitReached then 1 else 2
			local PriceStatusInShop1 = GetPriceStatusInShopFunction(B)
			local IsPriceStatusInShopMatch1: boolean = PriceStatusInShop1 == PriceStatus.Free or (PriceStatusInShop1 == PriceStatus.PurchaseFromRoblox or PriceStatusInShop1 == PriceStatus.PurchaseFromResale)
			
			return v3 < (if IsPriceStatusInShopMatch1 then 0 elseif PriceStatusInShop1 == PriceStatus.Owned or PriceStatusInShop1 == PriceStatus.QuantityLimitReached then 1 else 2)
		end)
		
		return List
	end,
	getPriceStatus = function(p14)
		-- upvalues: GetPriceStatusInShopFunction (copy)
		return GetPriceStatusInShopFunction(p14)
	end,
	PriceStatusEnum = PriceStatus
}