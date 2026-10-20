local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ItemTypeEnum = require(AvatarExperienceInspectAndBuy.Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local _ = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local ConvertAssetInfoToItemDataModule = require(AvatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local ConvertBundleInfoToItemDataModule = require(AvatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetPriceInRobuxFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux

return function(p1)
	-- upvalues: ItemTypeEnum (copy), ConvertAssetInfoToItemDataModule (copy), GetPriceStatusModule (copy), GetPriceInRobuxFunction (copy), ConvertBundleInfoToItemDataModule (copy)
	local ItemId = p1.itemId
	local CollectibleResellableInstances = p1.collectibleResellableInstances
	local StoredData = p1.storedData
	local Days = nil
	local PriceInRobux = nil
	local AssetTypeId = nil
	
	if p1.itemType == ItemTypeEnum.Asset then
		local Assets = p1.assetsMap and p1.assetsMap[ItemId]
		
		if not Assets then
			return nil
		end
		local ConvertAssetInfoToItemDataModuleResult = ConvertAssetInfoToItemDataModule(Assets, if Assets.collectibleItemId and CollectibleResellableInstances then CollectibleResellableInstances[Assets.collectibleItemId] else nil)
		PriceInRobux = GetPriceInRobuxFunction(ConvertAssetInfoToItemDataModuleResult, (GetPriceStatusModule(ConvertAssetInfoToItemDataModuleResult, true)))
		AssetTypeId = Assets.assetTypeId
		
		if StoredData and StoredData.timedOptions then
			for _, timedOption in StoredData.timedOptions do
				if timedOption.selected then
					Days = timedOption.days
					PriceInRobux = timedOption.price
					break
				end
			end
		end
	else
		local Bundles = p1.bundlesMap and p1.bundlesMap[ItemId]
		
		if not Bundles then
			return nil
		end
		local ConvertBundleInfoToItemDataModuleResult = ConvertBundleInfoToItemDataModule(Bundles, if Bundles.collectibleItemId and CollectibleResellableInstances then CollectibleResellableInstances[Bundles.collectibleItemId] else nil)
		PriceInRobux = GetPriceInRobuxFunction(ConvertBundleInfoToItemDataModuleResult, (GetPriceStatusModule(ConvertBundleInfoToItemDataModuleResult, true)))
		AssetTypeId = if ConvertBundleInfoToItemDataModuleResult then ConvertBundleInfoToItemDataModuleResult.itemSubType else nil
	end
	return {
		itemSubType = AssetTypeId,
		timedOptionDays = Days,
		price = PriceInRobux
	}
end