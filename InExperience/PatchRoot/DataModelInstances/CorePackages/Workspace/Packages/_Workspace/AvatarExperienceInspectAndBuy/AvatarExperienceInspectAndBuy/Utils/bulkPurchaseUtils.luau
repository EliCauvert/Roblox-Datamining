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

local function createBulkPurchaseRequestItem(p0) --[[ line: 64 ]]
	-- upvalues: itemTypeEnum (ref)
	return {
		id = p0.id and tonumber(p0.id) or 0,
		itemType = if p0.itemType == itemTypeEnum.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value
	}
end

return {
	convertAvatarItemToItemData = function(p1, p2) --[[ line: 33 ]]
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
	isPurchasableItem = function(p3) --[[ line: 54 ]]
		-- upvalues: priceStatusModule (ref)
		return if p3 ~= priceStatusModule.Free then if p3 ~= priceStatusModule.PurchaseFromRoblox then p3 == priceStatusModule.PurchaseFromResale else true else true
	end,
	createBulkPurchaseRequestItem = createBulkPurchaseRequestItem,
	getBulkPurchaseEligibleItems = function(p4, p5, p6) --[[ line: 78 ]]
		-- upvalues: itemTypeEnum (ref), convertAssetInfoToItemDataModule (ref), convertBundleInfoToItemDataModule (ref), getPriceStatusModule (ref), priceStatusModule (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), getPriceInRobux (ref), createBulkPurchaseRequestItem (ref)
		if not p4 then
			return { totalPrice = 0, requestedItems = {} }
		end
		local t = {}
		local var7 = 0
		
		for i, v in p4 do
			local var8
			if v.itemType == itemTypeEnum.Asset then
				local id = p5.assets[v.id]
				var8 = if not id then nil else convertAssetInfoToItemDataModule(id)
			elseif v.itemType == itemTypeEnum.Bundle then
				local id = p5.bundles[v.id]
				var8 = if not id then nil else convertBundleInfoToItemDataModule(id)
			else
				var8 = nil
			end
			local var9 = getPriceStatusModule(var8, true)
			
			if var8 then
				local var10 = if var9 ~= priceStatusModule.Free then if var9 ~= priceStatusModule.PurchaseFromRoblox then var9 == priceStatusModule.PurchaseFromResale else true else true
				
				if var10 then
					var10 = nil
					
					if fFlagAXEnableIaBTimedOptionsBulkPurchase then
						local _ = nil
						
						if p6 and var8.id then
							local id = p6[var8.id]
							
							if id and id.timedOptions then
								for i_1, v_1 in id.timedOptions do
									if v_1.selected then
										var10 = getPriceInRobux(var8, var9)
										local var11 = createBulkPurchaseRequestItem(var8)
										
										if v_1.days > 0 then
											var10 = v_1.price
											var11.PurchaseOptions = {
												{
													Type = Enum.PurchaseOption.TimedOption,
													Value = v_1.days * 86400
												}
											}
										end
										table.insert(t, var11)
									end
								end
							else
								var10 = getPriceInRobux(var8, var9)
								table.insert(t, createBulkPurchaseRequestItem(var8))
							end
						end
					else
						table.insert(t, createBulkPurchaseRequestItem(var8))
						var10 = getPriceInRobux(var8, var9)
					end
					if var10 ~= nil then
						var7 += var10
					end
				end
			end
		end
		return { requestedItems = t, totalPrice = var7 }
	end
}