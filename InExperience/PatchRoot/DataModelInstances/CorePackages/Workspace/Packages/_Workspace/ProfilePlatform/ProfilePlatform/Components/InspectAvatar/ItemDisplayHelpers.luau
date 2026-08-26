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

local function isPurchasableStatus(p1)
	-- upvalues: priceStatus (ref)
	return if p1 ~= priceStatus.Free then if p1 ~= priceStatus.PurchaseFromRoblox then p1 == priceStatus.PurchaseFromResale else true else true
end

local function _(p1)
	-- upvalues: enumsModule (ref)
	return if p1.itemType ~= enumsModule.ItemTypes.Bundle then p1.itemType == "Bundle" else true
end

local function getAssetTypeDisplayName(value, p1)
	-- upvalues: t (ref)
	if not value then
		return ""
	elseif p1 and p1[value] then
		return p1[value]
	end
	local var1 = tonumber(value)
	
	if not var1 then
		return t[value] or value
	end
	for i, v in Enum.AvatarAssetType:GetEnumItems() do
		if v.Value == var1 then
			return t[v.Name] or v.Name:gsub("(%l)(%u)", "%1 %2")
		end
	end
	return ""
end

return {
	isPurchasableStatus = isPurchasableStatus,
	getPriceStatus = function(p2)
		-- upvalues: getPriceStatusInShop (ref)
		return getPriceStatusInShop(p2)
	end,
	PriceStatusEnum = priceStatus,
	getThumbnailUrl = function(p2)
		-- upvalues: enumsModule (ref), bundleThumbnail (ref), asset (ref), getRbxthumbWithTypeSizeAndOptions (ref)
		return getRbxthumbWithTypeSizeAndOptions(p2.id, if if p2.itemType ~= enumsModule.ItemTypes.Bundle then p2.itemType == "Bundle" else true then bundleThumbnail else asset, 150)
	end,
	getItemTypeDisplayName = function(p2, p3)
		-- upvalues: enumsModule (ref), getAssetTypeDisplayName (ref)
		if p2.taxonomyName then
			return p2.taxonomyName
		end
		local assetTypeNames = p3.assetTypeNames
		
		return if if p2.itemType ~= enumsModule.ItemTypes.Bundle then p2.itemType == "Bundle" else true then if p2.itemSubType and assetTypeNames and assetTypeNames[p2.itemSubType] then assetTypeNames[p2.itemSubType] elseif p3 and p3.bundle then p3.bundle else "Bundle" else getAssetTypeDisplayName(p2.itemSubType, assetTypeNames)
	end,
	shouldShowBundleParts = function(p2)
		-- upvalues: getPriceStatusInShop (ref), priceStatus (ref)
		local var2 = getPriceStatusInShop(p2)
		
		if not p2.isOwned then
			return if if var2 ~= priceStatus.Free then if var2 ~= priceStatus.PurchaseFromRoblox then var2 == priceStatus.PurchaseFromResale else true else true then p2.bundlePartsCount ~= nil and p2.bundlePartsCount > 0 else false
		end
	end,
	ASSET_TYPE_LOCALIZATION_KEYS = constants.AssetLocalizationKeys,
	BUNDLE_TYPE_LOCALIZATION_KEYS = constants.BundleLocalizationKeys,
	PRICE_STATUS_LOCALIZATION_KEYS = constants.PriceStatusLocalizationKeys
}