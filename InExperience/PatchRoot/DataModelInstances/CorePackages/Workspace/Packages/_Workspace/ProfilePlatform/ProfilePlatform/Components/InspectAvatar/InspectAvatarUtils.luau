local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Common.AssetInfo)
local _ = require(parent.CatalogNetworking)
local avatarExperienceInspectAndBuyModule = require(parent.AvatarExperienceInspectAndBuy)
local getPriceStatusInShop = avatarExperienceInspectAndBuyModule.Utils.getPriceStatusInShop
local priceStatus = avatarExperienceInspectAndBuyModule.Enums.PriceStatus
local _ = require(profilePlatform.Common.Types)
local salesLocationType = require(parent.AvatarExperienceCommon).Enums.SalesLocationType
local t = {
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
local t_1 = {}

for i, v in Enum.AvatarAssetType:GetEnumItems() do
	if not t[v.Value] then
		t_1[v.Value] = true
	end
end
local function getPriceStatusForProfile(p1)
	-- upvalues: getPriceStatusInShop (ref)
	return getPriceStatusInShop(p1)
end

local function isWearableAssetType(value)
	-- upvalues: t_1 (ref)
	return t_1[value] == true
end

local function expandBundleToAssetIds(value)
	local t = {}
	
	if value.bundledItems then
		for i, v in value.bundledItems do
			if v.type == "Asset" then
				table.insert(t, v.id)
			end
		end
	end
	return t
end

local function collectBundleComponentIds(p1, p2)
	local t = {}
	
	for i, v in p1 do
		local var1 = p2[v]
		
		if var1 and var1.assetsInBundle then
			for i_1, v_1 in var1.assetsInBundle do
				t[tostring(v_1.id)] = true
			end
		end
	end
	return t
end

local function isPurchasableStatus(p3)
	-- upvalues: priceStatus (ref)
	return if p3 ~= priceStatus.Free then if p3 ~= priceStatus.PurchaseFromRoblox then p3 == priceStatus.PurchaseFromResale else true else true
end

local function isItemPurchasable(p3)
	-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
	if p3.isOwned then
		return false
	end
	local var2 = getPriceStatusInShop(p3)
	
	return (if var2 ~= priceStatus.Free then if var2 ~= priceStatus.PurchaseFromRoblox then var2 == priceStatus.PurchaseFromResale else true else true) and p3.collectibleProductId ~= nil
end

local function getEffectivePrice(p3)
	-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
	return if getPriceStatusInShop(p3) == priceStatus.PurchaseFromResale then if p3.collectibleItemDetails then p3.collectibleItemDetails.lowestResalePrice or 0 else 0 else p3.priceInRobux or 0
end

local function _(p3)
	-- upvalues: salesLocationType (ref)
	return if p3.saleLocationType == salesLocationType.ShopOnly then salesLocationType.ShopAndAllExperiences else p3.saleLocationType
end

local _ = function(p3, p4, p5)
	return if p4 and p4.quantityOwned ~= nil then p4.quantityOwned > 0 elseif p5 == nil then p3.owned == true else p5
end

local _ = function(p3)
	local itemRestrictions = p3.itemRestrictions
	
	if not itemRestrictions or #itemRestrictions == 0 then
		return nil
	end
	local t = {}
	
	for i, v in itemRestrictions do
		t[v] = true
	end
	return t
end

local function buildCollectibleItemDetails(p4, p5, p6)
	return if p4.hasResellers or (p4.unitsAvailableForConsumption or (p4.totalQuantity or (p4.lowestResalePrice or p5 and p5.quantityOwned))) then {
		hasResellers = p4.hasResellers,
		unitsAvailableForConsumption = p4.unitsAvailableForConsumption,
		totalQuantity = p4.totalQuantity,
		lowestResalePrice = p4.lowestResalePrice,
		resellableCount = if p5 then p5.quantityOwned else nil,
		collectibleLowestAvailableResaleProductId = p6
	} else nil
end

local function buildAssetsInBundle(value, p4)
	local var2 = nil
	
	if p4 and p4.assetsInBundle then
		local t = {}
		
		for i, v in p4.assetsInBundle do
			table.insert(t, {
				id = tostring(v.id),
				assetType = tostring(v.assetType),
				isIncluded = v.isIncluded
			})
		end
		var2 = t
		
		return var2
	elseif value.bundledItems then
		local t = {}
		
		for i, v in value.bundledItems do
			if v.type == "Asset" and v.assetType then
				table.insert(t, { id = tostring(v.id), assetType = tostring(v.assetType) })
			end
		end
		if #t > 0 then
			var2 = t
		end
	end
	return var2
end

local function computeBundleParts(p5, p6, p7)
	-- upvalues: t_1 (ref)
	local var3 = 0
	local t = {}
	
	if p6 and p6.assetsInBundle then
		for i, v in p6.assetsInBundle do
			if p7[tostring(v.id)] then
				var3 += 1
				
				if t_1[v.assetType] == true then
					table.insert(t, v.id)
				end
			end
		end
		return var3, t
	elseif p5.bundledItems then
		for i, v in p5.bundledItems do
			if v.type == "Asset" then
				var3 += 1
				
				if v.assetType and t_1[v.assetType] == true then
					table.insert(t, v.id)
				end
			end
		end
	end
	return var3, t
end

local _ = function(p8)
	return if p8.taxonomy and #p8.taxonomy > 0 then p8.taxonomy[1].taxonomyName else nil
end

return {
	isWearableAssetType = isWearableAssetType,
	expandBundleToAssetIds = expandBundleToAssetIds,
	collectBundleComponentIds = collectBundleComponentIds,
	buildItemData = function(p8, p9, p10, p11, p12, p13)
		-- upvalues: computeBundleParts (ref), salesLocationType (ref), buildCollectibleItemDetails (ref), buildAssetsInBundle (ref)
		local var4
		local assetType = p8.assetType or p8.bundleType
		local var5, var6 = computeBundleParts(p8, p9, p10)
		local t = {
			id = tostring(p8.id),
			name = p8.name,
			itemType = p8.itemType or "Asset",
			itemSubType = if assetType then tostring(assetType) else nil,
			priceInRobux = p8.price,
			creator = {
				creatorId = tostring(p8.creatorTargetId or ""),
				creatorName = p8.creatorName,
				creatorHasVerifiedBadge = p8.creatorHasVerifiedBadge
			},
			saleLocationType = if p8.saleLocationType == salesLocationType.ShopOnly then salesLocationType.ShopAndAllExperiences else p8.saleLocationType,
			isOffSale = p8.isOffSale
		}
		
		if p9 and p9.quantityOwned ~= nil then
			var4 = p9.quantityOwned > 0
			var4 = nil
		else
			var4 = if p12 ~= nil then p8.owned == true else p12
		end
		local var7
		t.isOwned = var4
		t.noPriceStatus = if p9 then p9.noPriceStatus else nil
		t.catalogPriceStatus = p8.priceStatus
		t.collectibleItemId = p8.collectibleItemId
		local itemRestrictions = p8.itemRestrictions
		
		if itemRestrictions and #itemRestrictions ~= 0 then
			local t_1 = {}
			
			for i, v in itemRestrictions do
				t_1[v] = true
			end
			var7 = t_1
		else
			var7 = nil
		end
		t.itemRestrictions = var7
		t.collectibleItemDetails = buildCollectibleItemDetails(p8, p9, p13)
		t.assetsInBundle = buildAssetsInBundle(p8, p9)
		t.collectibleProductId = if p9 then p9.collectibleProductId else p11
		t.bundlePartsCount = var5
		t.bundleAssetIds = var6
		t.taxonomyName = if p8.taxonomy and #p8.taxonomy > 0 then p8.taxonomy[1].taxonomyName else nil
		
		return t
	end,
	isPurchasableStatus = isPurchasableStatus,
	isItemPurchasable = isItemPurchasable,
	getEffectivePrice = getEffectivePrice,
	sortDisplayItems = function(p14)
		-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
		table.sort(p14, function(p15, p16)
			-- upvalues: getPriceStatusInShop (copy), priceStatus (copy)
			local function _(p17)
				-- upvalues: getPriceStatusInShop (copy), priceStatus (copy)
				local var8 = getPriceStatusInShop(p17)
				
				return if if var8 ~= priceStatus.Free then if var8 ~= priceStatus.PurchaseFromRoblox then var8 == priceStatus.PurchaseFromResale else true else true then 0 elseif var8 == priceStatus.Owned or var8 == priceStatus.QuantityLimitReached then 1 else 2
			end
			
			local var8 = getPriceStatusInShop(p15)
			local var9 = if if var8 ~= priceStatus.Free then if var8 ~= priceStatus.PurchaseFromRoblox then var8 == priceStatus.PurchaseFromResale else true else true then 0 elseif var8 == priceStatus.Owned or var8 == priceStatus.QuantityLimitReached then 1 else 2
			local var10 = getPriceStatusInShop(p16)
			var8 = if if var10 ~= priceStatus.Free then if var10 ~= priceStatus.PurchaseFromRoblox then var10 == priceStatus.PurchaseFromResale else true else true then 0 elseif var10 == priceStatus.Owned or var10 == priceStatus.QuantityLimitReached then 1 else 2
			
			return var9 < var8
		end)
		
		return p14
	end,
	getPriceStatus = getPriceStatusForProfile,
	PriceStatusEnum = priceStatus
}