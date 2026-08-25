local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local enumsModule = require(profilePlatform.Common.Enums)
local userLibModule = require(parent.UserLib)
local avatarExperienceInspectAndBuyModule = require(parent.AvatarExperienceInspectAndBuy)
local constants = avatarExperienceInspectAndBuyModule.Constants
local getPriceStatusInShop = avatarExperienceInspectAndBuyModule.Utils.getPriceStatusInShop
local priceStatus = avatarExperienceInspectAndBuyModule.Enums.PriceStatus
local constants_1 = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(profilePlatform.Common.Types)
local asset = constants_1.RbxthumbTypes.Asset
local bundleThumbnail = constants_1.RbxthumbTypes.BundleThumbnail
local t = {
	Shirt = "Classic Shirt",
	Pants = "Classic Pants",
	TShirt = "Classic T-Shirt",
	TShirtAccessory = "T-Shirt",
	DressSkirtAccessory = "Dresses & Skirts"
}

local function isPurchasableStatus(p0)
	-- upvalues: priceStatus (ref)
	return if p0 ~= priceStatus.Free then if p0 ~= priceStatus.PurchaseFromRoblox then p0 == priceStatus.PurchaseFromResale else true else true
end

local function _(p1)
	-- upvalues: enumsModule (ref)
	return if p1.itemType ~= enumsModule.ItemTypes.Bundle then p1.itemType == "Bundle" else true
end

local function getAssetTypeDisplayName(value, p2)
	-- upvalues: t (ref)
	if not value then
		return ""
	elseif p2 and p2[value] then
		return p2[value]
	end
	local var7 = tonumber(value)
	
	if not var7 then
		return t[value] or value
	end
	for i, v in Enum.AvatarAssetType:GetEnumItems() do
		if v.Value == var7 then
			return t[v.Name] or v.Name:gsub("(%l)(%u)", "%1 %2")
		end
	end
	return ""
end

return {
	isPurchasableStatus = isPurchasableStatus,
	getPriceStatus = function(p3)
		-- upvalues: getPriceStatusInShop (ref)
		return getPriceStatusInShop(p3)
	end,
	PriceStatusEnum = priceStatus,
	getThumbnailUrl = function(p4)
		-- upvalues: enumsModule (ref), bundleThumbnail (ref), asset (ref), getRbxthumbWithTypeSizeAndOptions (ref)
		return getRbxthumbWithTypeSizeAndOptions(p4.id, if if p4.itemType ~= enumsModule.ItemTypes.Bundle then p4.itemType == "Bundle" else true then bundleThumbnail else asset, 150)
	end,
	getItemTypeDisplayName = function(p5, p6)
		-- upvalues: enumsModule (ref), getAssetTypeDisplayName (ref)
		if p5.taxonomyName then
			return p5.taxonomyName
		end
		local assetTypeNames = p6.assetTypeNames
		
		return if if p5.itemType ~= enumsModule.ItemTypes.Bundle then p5.itemType == "Bundle" else true then if p5.itemSubType and assetTypeNames and assetTypeNames[p5.itemSubType] then assetTypeNames[p5.itemSubType] elseif p6 and p6.bundle then p6.bundle else "Bundle" else getAssetTypeDisplayName(p5.itemSubType, assetTypeNames)
	end,
	shouldShowBundleParts = function(p7)
		-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
		local var8 = getPriceStatusInShop(p7)
		
		if not p7.isOwned then
			return if if var8 ~= priceStatus.Free then if var8 ~= priceStatus.PurchaseFromRoblox then var8 == priceStatus.PurchaseFromResale else true else true then p7.bundlePartsCount ~= nil and p7.bundlePartsCount > 0 else false
		end
	end,
	ASSET_TYPE_LOCALIZATION_KEYS = constants.AssetLocalizationKeys,
	BUNDLE_TYPE_LOCALIZATION_KEYS = constants.BundleLocalizationKeys,
	PRICE_STATUS_LOCALIZATION_KEYS = constants.PriceStatusLocalizationKeys
}