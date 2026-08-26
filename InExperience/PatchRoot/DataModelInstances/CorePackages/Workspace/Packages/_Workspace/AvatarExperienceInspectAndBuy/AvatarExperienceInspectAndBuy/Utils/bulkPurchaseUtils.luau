local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local itemTypeEnum = require(parent.AXCommon).Enums.ItemTypeEnum
local _ = require(avatarExperienceInspectAndBuy.Types)
local convertAssetInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceInRobux = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase

local function createBulkPurchaseRequestItem(p1)
	-- upvalues: itemTypeEnum (ref)
	return {
		id = p1.id and tonumber(p1.id) or 0,
		itemType = if p1.itemType == itemTypeEnum.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value
	}
end

return {
	convertAvatarItemToItemData = function(p1, p2)
		-- upvalues: itemTypeEnum (ref), convertAssetInfoToItemDataModule (ref), convertBundleInfoToItemDataModule (ref)
		if p1.itemType == itemTypeEnum.Asset then
			local id = p2.assets[p1.id]
			
			return if id then convertAssetInfoToItemDataModule(id) else nil
		elseif p1.itemType ~= itemTypeEnum.Bundle then
			return nil
		end
		local id = p2.bundles[p1.id]
		
		return if id then convertBundleInfoToItemDataModule(id) else nil
	end,
	isPurchasableItem = function(p1)
		-- upvalues: priceStatusModule (ref)
		return if p1 ~= priceStatusModule.Free then if p1 ~= priceStatusModule.PurchaseFromRoblox then p1 == priceStatusModule.PurchaseFromResale else true else true
	end,
	createBulkPurchaseRequestItem = createBulkPurchaseRequestItem,
	getBulkPurchaseEligibleItems = function(p1, p2, p3)
		-- upvalues: itemTypeEnum (ref), convertAssetInfoToItemDataModule (ref), convertBundleInfoToItemDataModule (ref), getPriceStatusModule (ref), priceStatusModule (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), getPriceInRobux (ref), createBulkPurchaseRequestItem (ref)
		if not p1 then
			return { totalPrice = 0, requestedItems = {} }
		end
		local t = {}
		local var1 = 0
		
		for i, v in p1 do
			local var2
			if v.itemType == itemTypeEnum.Asset then
				local id = p2.assets[v.id]
				var2 = if not id then nil else convertAssetInfoToItemDataModule(id)
			elseif v.itemType == itemTypeEnum.Bundle then
				local id = p2.bundles[v.id]
				var2 = if not id then nil else convertBundleInfoToItemDataModule(id)
			else
				var2 = nil
			end
			local var3 = getPriceStatusModule(var2, true)
			
			if var2 then
				local var4 = if var3 ~= priceStatusModule.Free then if var3 ~= priceStatusModule.PurchaseFromRoblox then var3 == priceStatusModule.PurchaseFromResale else true else true
				
				if var4 then
					var4 = nil
					
					if fFlagAXEnableIaBTimedOptionsBulkPurchase then
						local _ = nil
						
						if p3 and var2.id then
							local id = p3[var2.id]
							
							if id and id.timedOptions then
								for i_1, v_1 in id.timedOptions do
									if v_1.selected then
										var4 = getPriceInRobux(var2, var3)
										local var5 = createBulkPurchaseRequestItem(var2)
										
										if v_1.days > 0 then
											var4 = v_1.price
											var5.PurchaseOptions = {
												{
													Type = Enum.PurchaseOption.TimedOption,
													Value = v_1.days * 86400
												}
											}
										end
										table.insert(t, var5)
									end
								end
							else
								var4 = getPriceInRobux(var2, var3)
								table.insert(t, createBulkPurchaseRequestItem(var2))
							end
						end
					else
						table.insert(t, createBulkPurchaseRequestItem(var2))
						var4 = getPriceInRobux(var2, var3)
					end
					if var4 ~= nil then
						var1 += var4
					end
				end
			end
		end
		return { requestedItems = t, totalPrice = var1 }
	end
}