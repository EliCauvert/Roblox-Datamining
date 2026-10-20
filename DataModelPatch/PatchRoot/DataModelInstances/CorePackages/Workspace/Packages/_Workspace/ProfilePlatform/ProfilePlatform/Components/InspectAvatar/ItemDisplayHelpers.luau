local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UserLibModule = require(Parent.UserLib)
local AvatarExperienceInspectAndBuyModule = require(Parent.AvatarExperienceInspectAndBuy)
local Constants = AvatarExperienceInspectAndBuyModule.Constants
local GetPriceStatusInShopFunction = AvatarExperienceInspectAndBuyModule.Utils.getPriceStatusInShop
local PriceStatus = AvatarExperienceInspectAndBuyModule.Enums.PriceStatus
local Constants1 = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(ProfilePlatform.Common.Types)
local Asset = Constants1.RbxthumbTypes.Asset
local BundleThumbnail = Constants1.RbxthumbTypes.BundleThumbnail
local config = {
	Shirt = "Classic Shirt",
	Pants = "Classic Pants",
	TShirt = "Classic T-Shirt",
	TShirtAccessory = "T-Shirt",
	DressSkirtAccessory = "Dresses & Skirts"
}

local function _(p1): boolean
	-- upvalues: EnumsModule (copy)
	return p1.itemType == EnumsModule.ItemTypes.Bundle or p1.itemType == "Bundle"
end

local function getAssetTypeDisplayName(ItemSubType, AssetTypeNames)
	-- upvalues: config (copy)
	if not ItemSubType then
		return ""
	end
	if AssetTypeNames and AssetTypeNames[ItemSubType] then
		return AssetTypeNames[ItemSubType]
	end
	local Number: number? = tonumber(ItemSubType)
	
	if not Number then
		return config[ItemSubType] or ItemSubType
	end
	for _, enumItem in Enum.AvatarAssetType:GetEnumItems() do
		if enumItem.Value == Number then
			return config[enumItem.Name] or enumItem.Name:gsub("(%l)(%u)", "%1 %2")
		end
	end
	return ""
end

return {
	isPurchasableStatus = function(Free): boolean
		-- upvalues: PriceStatus (copy)
		return Free == PriceStatus.Free or (Free == PriceStatus.PurchaseFromRoblox or Free == PriceStatus.PurchaseFromResale)
	end,
	getPriceStatus = function(p1)
		-- upvalues: GetPriceStatusInShopFunction (copy)
		return GetPriceStatusInShopFunction(p1)
	end,
	PriceStatusEnum = PriceStatus,
	getThumbnailUrl = function(p1)
		-- upvalues: EnumsModule (copy), BundleThumbnail (copy), Asset (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy)
		local IsItemTypeMatch: boolean = p1.itemType == EnumsModule.ItemTypes.Bundle or p1.itemType == "Bundle"
		
		return GetRbxthumbWithTypeSizeAndOptionsFunction(p1.id, if IsItemTypeMatch then BundleThumbnail else Asset, 150)
	end,
	getItemTypeDisplayName = function(p1, p2)
		-- upvalues: EnumsModule (copy), getAssetTypeDisplayName (copy)
		if p1.taxonomyName then
			return p1.taxonomyName
		else
			local AssetTypeNames = p2.assetTypeNames
			local IsItemTypeMatch: boolean = p1.itemType == EnumsModule.ItemTypes.Bundle or p1.itemType == "Bundle"
			
			return if IsItemTypeMatch then if p1.itemSubType and AssetTypeNames and AssetTypeNames[p1.itemSubType] then AssetTypeNames[p1.itemSubType] elseif p2 and p2.bundle then p2.bundle else "Bundle" else getAssetTypeDisplayName(p1.itemSubType, AssetTypeNames)
		end
	end,
	shouldShowBundleParts = function(p1): boolean
		-- upvalues: GetPriceStatusInShopFunction (copy), PriceStatus (copy)
		local PriceStatusInShop = GetPriceStatusInShopFunction(p1)
		
		if p1.isOwned or PriceStatusInShop ~= PriceStatus.Free and (PriceStatusInShop ~= PriceStatus.PurchaseFromRoblox and PriceStatusInShop ~= PriceStatus.PurchaseFromResale) then
			return false
		else
			return p1.bundlePartsCount ~= nil and p1.bundlePartsCount > 0
		end
	end,
	ASSET_TYPE_LOCALIZATION_KEYS = Constants.AssetLocalizationKeys,
	BUNDLE_TYPE_LOCALIZATION_KEYS = Constants.BundleLocalizationKeys,
	PRICE_STATUS_LOCALIZATION_KEYS = Constants.PriceStatusLocalizationKeys
}