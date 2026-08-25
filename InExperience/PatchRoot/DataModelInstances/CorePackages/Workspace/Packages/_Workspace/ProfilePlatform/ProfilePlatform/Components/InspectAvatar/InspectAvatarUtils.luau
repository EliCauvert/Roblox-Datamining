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
local function getPriceStatusForProfile(p0)
	-- upvalues: getPriceStatusInShop (ref)
	return getPriceStatusInShop(p0)
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
		local var16 = p2[v]
		
		if var16 and var16.assetsInBundle then
			for i_1, v_1 in var16.assetsInBundle do
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

local function isItemPurchasable(p4)
	-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
	if p4.isOwned then
		return false
	end
	local var17 = getPriceStatusInShop(p4)
	
	return (if var17 ~= priceStatus.Free then if var17 ~= priceStatus.PurchaseFromRoblox then var17 == priceStatus.PurchaseFromResale else true else true) and p4.collectibleProductId ~= nil
end

local function getEffectivePrice(p5)
	-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
	return if getPriceStatusInShop(p5) == priceStatus.PurchaseFromResale then if p5.collectibleItemDetails then p5.collectibleItemDetails.lowestResalePrice or 0 else 0 else p5.priceInRobux or 0
end

local function _(p6)
	-- upvalues: salesLocationType (ref)
	return if p6.saleLocationType == salesLocationType.ShopOnly then salesLocationType.ShopAndAllExperiences else p6.saleLocationType
end

local _ = function(p7, p8, p9)
	return if p8 and p8.quantityOwned ~= nil then p8.quantityOwned > 0 elseif p9 == nil then p7.owned == true else p9
end

local _ = function(p10)
	local itemRestrictions = p10.itemRestrictions
	
	if not itemRestrictions or #itemRestrictions == 0 then
		return nil
	end
	local t = {}
	
	for i, v in itemRestrictions do
		t[v] = true
	end
	return t
end

local function buildCollectibleItemDetails(p11, p12, p13)
	return if p11.hasResellers or (p11.unitsAvailableForConsumption or (p11.totalQuantity or (p11.lowestResalePrice or p12 and p12.quantityOwned))) then {
		hasResellers = p11.hasResellers,
		unitsAvailableForConsumption = p11.unitsAvailableForConsumption,
		totalQuantity = p11.totalQuantity,
		lowestResalePrice = p11.lowestResalePrice,
		resellableCount = if p12 then p12.quantityOwned else nil,
		collectibleLowestAvailableResaleProductId = p13
	} else nil
end

local function buildAssetsInBundle(value, p14)
	local var19 = nil
	
	if p14 and p14.assetsInBundle then
		local t = {}
		
		for i, v in p14.assetsInBundle do
			table.insert(t, {
				id = tostring(v.id),
				assetType = tostring(v.assetType),
				isIncluded = v.isIncluded
			})
		end
		var19 = t
		
		return var19
	elseif value.bundledItems then
		local t = {}
		
		for i, v in value.bundledItems do
			if v.type == "Asset" and v.assetType then
				table.insert(t, { id = tostring(v.id), assetType = tostring(v.assetType) })
			end
		end
		if #t > 0 then
			var19 = t
		end
	end
	return var19
end

local function computeBundleParts(p15, p16, p17)
	-- upvalues: t_1 (ref)
	local var22 = 0
	local t = {}
	
	if p16 and p16.assetsInBundle then
		for i, v in p16.assetsInBundle do
			if p17[tostring(v.id)] then
				var22 += 1
				
				if t_1[v.assetType] == true then
					table.insert(t, v.id)
				end
			end
		end
		return var22, t
	elseif p15.bundledItems then
		for i, v in p15.bundledItems do
			if v.type == "Asset" then
				var22 += 1
				
				if v.assetType and t_1[v.assetType] == true then
					table.insert(t, v.id)
				end
			end
		end
	end
	return var22, t
end

local _ = function(p18)
	return if p18.taxonomy and #p18.taxonomy > 0 then p18.taxonomy[1].taxonomyName else nil
end

return {
	isWearableAssetType = isWearableAssetType,
	expandBundleToAssetIds = expandBundleToAssetIds,
	collectBundleComponentIds = collectBundleComponentIds,
	buildItemData = function(p19, p20, p21, p22, p23, p24)
		-- upvalues: computeBundleParts (ref), salesLocationType (ref), buildCollectibleItemDetails (ref), buildAssetsInBundle (ref)
		local var28
		local assetType = p19.assetType or p19.bundleType
		local var25, var26 = computeBundleParts(p19, p20, p21)
		local t = {
			id = tostring(p19.id),
			name = p19.name,
			itemType = p19.itemType or "Asset",
			itemSubType = if assetType then tostring(assetType) else nil,
			priceInRobux = p19.price,
			creator = {
				creatorId = tostring(p19.creatorTargetId or ""),
				creatorName = p19.creatorName,
				creatorHasVerifiedBadge = p19.creatorHasVerifiedBadge
			},
			saleLocationType = if p19.saleLocationType == salesLocationType.ShopOnly then salesLocationType.ShopAndAllExperiences else p19.saleLocationType,
			isOffSale = p19.isOffSale
		}
		
		if p20 and p20.quantityOwned ~= nil then
			var28 = p20.quantityOwned > 0
			var28 = nil
		else
			var28 = if p23 ~= nil then p19.owned == true else p23
		end
		local var29
		t.isOwned = var28
		t.noPriceStatus = if p20 then p20.noPriceStatus else nil
		t.catalogPriceStatus = p19.priceStatus
		t.collectibleItemId = p19.collectibleItemId
		local itemRestrictions = p19.itemRestrictions
		
		if itemRestrictions and #itemRestrictions ~= 0 then
			local t_1 = {}
			
			for i, v in itemRestrictions do
				t_1[v] = true
			end
			var29 = t_1
		else
			var29 = nil
		end
		t.itemRestrictions = var29
		t.collectibleItemDetails = buildCollectibleItemDetails(p19, p20, p24)
		t.assetsInBundle = buildAssetsInBundle(p19, p20)
		t.collectibleProductId = if p20 then p20.collectibleProductId else p22
		t.bundlePartsCount = var25
		t.bundleAssetIds = var26
		t.taxonomyName = if p19.taxonomy and #p19.taxonomy > 0 then p19.taxonomy[1].taxonomyName else nil
		
		return t
	end,
	isPurchasableStatus = isPurchasableStatus,
	isItemPurchasable = isItemPurchasable,
	getEffectivePrice = getEffectivePrice,
	sortDisplayItems = function(p25)
		-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
		table.sort(p25, function(p26, p27)
			-- upvalues: getPriceStatusInShop (copy), priceStatus (copy)
			local function _(p28)
				-- upvalues: getPriceStatusInShop (copy), priceStatus (copy)
				local var34 = getPriceStatusInShop(p28)
				
				return if if var34 ~= priceStatus.Free then if var34 ~= priceStatus.PurchaseFromRoblox then var34 == priceStatus.PurchaseFromResale else true else true then 0 elseif var34 == priceStatus.Owned or var34 == priceStatus.QuantityLimitReached then 1 else 2
			end
			
			local var31 = getPriceStatusInShop(p26)
			local var32 = if if var31 ~= priceStatus.Free then if var31 ~= priceStatus.PurchaseFromRoblox then var31 == priceStatus.PurchaseFromResale else true else true then 0 elseif var31 == priceStatus.Owned or var31 == priceStatus.QuantityLimitReached then 1 else 2
			local var33 = getPriceStatusInShop(p27)
			var31 = if if var33 ~= priceStatus.Free then if var33 ~= priceStatus.PurchaseFromRoblox then var33 == priceStatus.PurchaseFromResale else true else true then 0 elseif var33 == priceStatus.Owned or var33 == priceStatus.QuantityLimitReached then 1 else 2
			
			return var32 < var31
		end)
		
		return p25
	end,
	getPriceStatus = getPriceStatusForProfile,
	PriceStatusEnum = priceStatus
}