local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local ItemTypeEnum = require(AvatarExperienceInspectAndBuy.Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ConvertAssetInfoToItemDataModule = require(AvatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local ConvertBundleInfoToItemDataModule = require(AvatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetPriceInRobuxFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local _ = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local function createBulkPurchaseRequestItem(BulkPurchaseRequestItem) --[[ Line: 62 ]]
	-- upvalues: ItemTypeEnum (copy)
	return {
		id = BulkPurchaseRequestItem.id and tonumber(BulkPurchaseRequestItem.id) or 0,
		itemType = if BulkPurchaseRequestItem.itemType == ItemTypeEnum.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value
	}
end

return {
	convertAvatarItemToItemData = function(BulkPurchaseRequestItem, p1) --[[ Line: 31 ]]
		-- upvalues: ItemTypeEnum (copy), ConvertAssetInfoToItemDataModule (copy), ConvertBundleInfoToItemDataModule (copy)
		if BulkPurchaseRequestItem.itemType == ItemTypeEnum.Asset then
			local Asset = p1.assets[BulkPurchaseRequestItem.id]
			
			return if Asset then ConvertAssetInfoToItemDataModule(Asset) else nil
		elseif BulkPurchaseRequestItem.itemType == ItemTypeEnum.Bundle then
			local Bundle = p1.bundles[BulkPurchaseRequestItem.id]
			
			return if Bundle then ConvertBundleInfoToItemDataModule(Bundle) else nil
		else
			return nil
		end
	end,
	isPurchasableItem = function(Free): boolean --[[ Line: 52 ]]
		-- upvalues: PriceStatusModule (copy)
		return Free == PriceStatusModule.Free or (Free == PriceStatusModule.PurchaseFromRoblox or Free == PriceStatusModule.PurchaseFromResale)
	end,
	createBulkPurchaseRequestItem = createBulkPurchaseRequestItem,
	getBulkPurchaseEligibleItems = function(List, p1, p2) --[[ Line: 76 ]]
		-- upvalues: ItemTypeEnum (copy), ConvertAssetInfoToItemDataModule (copy), ConvertBundleInfoToItemDataModule (copy), GetPriceStatusModule (copy), PriceStatusModule (copy), GetPriceInRobuxFunction (copy), createBulkPurchaseRequestItem (copy)
		if not List then
			return { totalPrice = 0, requestedItems = {} }
		end
		local List1 = {}
		local TotalPrice = 0
		local PriceStatusModule1 = nil
		local ConvertAssetInfoToItemDataModuleResult = nil
		local Price = nil
		
		for _, BulkPurchaseRequestItem in List do
			if BulkPurchaseRequestItem.itemType == ItemTypeEnum.Asset then
				local Asset = p1.assets[BulkPurchaseRequestItem.id]
				ConvertAssetInfoToItemDataModuleResult = if Asset then ConvertAssetInfoToItemDataModule(Asset) else nil
			elseif BulkPurchaseRequestItem.itemType == ItemTypeEnum.Bundle then
				local Bundle = p1.bundles[BulkPurchaseRequestItem.id]
				ConvertAssetInfoToItemDataModuleResult = if Bundle then ConvertBundleInfoToItemDataModule(Bundle) else nil
			else
				ConvertAssetInfoToItemDataModuleResult = nil
			end
			PriceStatusModule1 = GetPriceStatusModule(ConvertAssetInfoToItemDataModuleResult, true)
			
			if ConvertAssetInfoToItemDataModuleResult and (PriceStatusModule1 == PriceStatusModule.Free or (PriceStatusModule1 == PriceStatusModule.PurchaseFromRoblox or PriceStatusModule1 == PriceStatusModule.PurchaseFromResale)) then
				Price = nil
				
				if ConvertAssetInfoToItemDataModuleResult.id then
					local v1 = p2[ConvertAssetInfoToItemDataModuleResult.id]
					
					if v1 and v1.timedOptions then
						for _, timedOption in v1.timedOptions do
							if timedOption.selected then
								Price = GetPriceInRobuxFunction(ConvertAssetInfoToItemDataModuleResult, PriceStatusModule1)
								local BulkPurchaseRequestItem1 = createBulkPurchaseRequestItem(ConvertAssetInfoToItemDataModuleResult)
								
								if timedOption.days > 0 then
									Price = timedOption.price
									BulkPurchaseRequestItem1.PurchaseOptions = {
										{
											Type = Enum.PurchaseOption.TimedOption,
											Value = timedOption.days * 86400
										}
									}
								end
								table.insert(List1, BulkPurchaseRequestItem1)
								break
							end
						end
					else
						Price = GetPriceInRobuxFunction(ConvertAssetInfoToItemDataModuleResult, PriceStatusModule1)
						table.insert(List1, (createBulkPurchaseRequestItem(ConvertAssetInfoToItemDataModuleResult)))
					end
				end
				if Price ~= nil then
					TotalPrice += Price
				end
			end
		end
		return { requestedItems = List1, totalPrice = TotalPrice }
	end
}