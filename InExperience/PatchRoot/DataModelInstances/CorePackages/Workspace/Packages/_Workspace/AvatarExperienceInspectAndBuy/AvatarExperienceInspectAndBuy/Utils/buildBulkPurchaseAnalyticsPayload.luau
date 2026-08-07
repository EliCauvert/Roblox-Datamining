local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(avatarExperienceInspectAndBuy.Types)
local itemTypeEnum = require(avatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local convertAssetInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceInRobux = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux

return function(p0) --[[ line: 47 | named "buildBulkPurchaseAnalyticsPayload" ]]
	-- upvalues: itemTypeEnum (ref), convertAssetInfoToItemDataModule (ref), getPriceStatusModule (ref), getPriceInRobux (ref), convertBundleInfoToItemDataModule (ref)
	local var6, assetTypeId
	local itemId = p0.itemId
	local collectibleResellableInstances = p0.collectibleResellableInstances
	local storedData = p0.storedData
	local _ = nil
	local _ = nil
	local days = nil
	
	if p0.itemType == itemTypeEnum.Asset then
		local var4 = p0.assetsMap and p0.assetsMap[itemId]
		
		if not var4 then
			return nil
		end
		local var5 = convertAssetInfoToItemDataModule(var4, if var4.collectibleItemId and collectibleResellableInstances then collectibleResellableInstances[var4.collectibleItemId] else nil)
		var6 = getPriceInRobux(var5, getPriceStatusModule(var5, true))
		assetTypeId = var4.assetTypeId
		
		if storedData and storedData.timedOptions then
			for i, v in storedData.timedOptions do
				if v.selected then
					days = v.days
					var6 = v.price
				end
			end
		end
	else
		local var7 = p0.bundlesMap and p0.bundlesMap[itemId]
		
		if not var7 then
			return nil
		end
		local var8 = convertBundleInfoToItemDataModule(var7, if var7.collectibleItemId and collectibleResellableInstances then collectibleResellableInstances[var7.collectibleItemId] else nil)
		var6 = getPriceInRobux(var8, getPriceStatusModule(var8, true))
		assetTypeId = if var8 then var8.itemSubType else nil
	end
	return {
		itemSubType = assetTypeId,
		timedOptionDays = days,
		price = var6
	}
end