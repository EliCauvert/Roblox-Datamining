local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local _ = require(avatarExperienceInspectAndBuy.Types)
local itemTypeEnum = require(avatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local convertAssetInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceInRobux = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux

return function(p1)
	-- upvalues: itemTypeEnum (ref), convertAssetInfoToItemDataModule (ref), getPriceStatusModule (ref), getPriceInRobux (ref), convertBundleInfoToItemDataModule (ref)
	local var1, assetTypeId
	local itemId = p1.itemId
	local collectibleResellableInstances = p1.collectibleResellableInstances
	local storedData = p1.storedData
	local _ = nil
	local _ = nil
	local days = nil
	
	if p1.itemType == itemTypeEnum.Asset then
		local var2 = p1.assetsMap and p1.assetsMap[itemId]
		
		if not var2 then
			return nil
		end
		local var3 = convertAssetInfoToItemDataModule(var2, if var2.collectibleItemId and collectibleResellableInstances then collectibleResellableInstances[var2.collectibleItemId] else nil)
		var1 = getPriceInRobux(var3, getPriceStatusModule(var3, true))
		assetTypeId = var2.assetTypeId
		
		if storedData and storedData.timedOptions then
			for i, v in storedData.timedOptions do
				if v.selected then
					days = v.days
					var1 = v.price
				end
			end
		end
	else
		local var4 = p1.bundlesMap and p1.bundlesMap[itemId]
		
		if not var4 then
			return nil
		end
		local var5 = convertBundleInfoToItemDataModule(var4, if var4.collectibleItemId and collectibleResellableInstances then collectibleResellableInstances[var4.collectibleItemId] else nil)
		var1 = getPriceInRobux(var5, getPriceStatusModule(var5, true))
		assetTypeId = if var5 then var5.itemSubType else nil
	end
	return {
		itemSubType = assetTypeId,
		timedOptionDays = days,
		price = var1
	}
end