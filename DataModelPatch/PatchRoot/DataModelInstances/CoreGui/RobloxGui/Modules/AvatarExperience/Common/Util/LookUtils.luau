local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.Reducers.Looks)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.PurchasePrompt)
local AXMISFixOpenLookDetailsModal = game:DefineFastFlag("AXMISFixOpenLookDetailsModal", false)
local FFlagPurchasePromptFetchCartPricingForLooks = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks

local function _(p1, p2)
	if p2.selectedTimedOptionIndex and p1.timedOptions then
		local TimedOption = p1.timedOptions[p2.selectedTimedOptionIndex]
		
		if TimedOption and TimedOption.days then
			return TimedOption.days
		end
	end
	return nil
end

local _ = function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1.itemId == tostring(ConstantsModule.BlockyBundleId)
end

local _ = function(p1, p2): boolean
	return not p1.selectedInTryOnManager or (not p2.isPurchasable or p2.quantityOwned > 0)
end

local _ = function(p1, p2)
	local LookBundleInfo = (p1.lookBundleInfos or {})[tostring(p2.itemId)]
	
	return p1.lookAssetInfos[tostring(p2.itemId)] or LookBundleInfo
end

local function getCartPricingRequestedItemsForLookId(List, p1, p2)
	-- upvalues: ConstantsModule (copy)
	local List1 = {}
	local t = {}
	local v1 = p1[p2]
	
	if List == nil or v1 == nil then
		return List1
	end
	for _, value in List do
		local LookBundleInfo = (v1.lookBundleInfos or {})[tostring(value.itemId)]
		local LookAssetInfo = v1.lookAssetInfos[tostring(value.itemId)] or LookBundleInfo
		
		if LookAssetInfo ~= nil and value.itemId ~= tostring(ConstantsModule.BlockyBundleId) and (value.selectedInTryOnManager and (LookAssetInfo.isPurchasable and LookAssetInfo.quantityOwned <= 0)) then
			local CollectibleItemId = LookAssetInfo.collectibleItemId
			
			if type(CollectibleItemId) == "string" and CollectibleItemId ~= "" then
				local Days = nil
				if value.selectedTimedOptionIndex and LookAssetInfo.timedOptions then
					local TimedOption = LookAssetInfo.timedOptions[value.selectedTimedOptionIndex]
					
					if TimedOption and TimedOption.days then
						Days = TimedOption.days
						local Text = CollectibleItemId .. "\0" .. (if type(Days) == "number" and Days > 0 then tostring(Days) else "perm")
						
						if not t[Text] then
							t[Text] = true
							table.insert(List1, { collectibleItemId = CollectibleItemId, rentalDays = Days })
						end
						continue
					end
				end
				Days = nil
			end
		end
	end
	return List1
end

return {
	getPurchaseInfoForLookId = function(List, p3, p4)
		-- upvalues: AXMISFixOpenLookDetailsModal (copy), FFlagPurchasePromptFetchCartPricingForLooks (copy), ConstantsModule (copy)
		local ItemIds = {}
		local ItemIds1 = {}
		local List1 = {}
		local List2 = {}
		local Total = 0
		local v2 = p3[p4]
		
		if List == nil or v2 == nil then
			return Total, ItemIds, ItemIds1, List1
		end
		for _, value in List do
			local LookAssetInfo = v2.lookAssetInfos[tostring(value.itemId)]
			local LookBundleInfo = (v2.lookBundleInfos or {})[tostring(value.itemId)]
			
			if not AXMISFixOpenLookDetailsModal then
				assert(LookAssetInfo or LookBundleInfo, "itemInfo should not be nil")
			end
			local LookAssetInfo1 = LookAssetInfo or LookBundleInfo
			
			if not AXMISFixOpenLookDetailsModal or LookAssetInfo1 then
				if FFlagPurchasePromptFetchCartPricingForLooks then
					local LookBundleInfo1 = (v2.lookBundleInfos or {})[tostring(value.itemId)]
					LookAssetInfo1 = v2.lookAssetInfos[tostring(value.itemId)] or LookBundleInfo1
				end
				if (not FFlagPurchasePromptFetchCartPricingForLooks or value.itemId ~= tostring(ConstantsModule.BlockyBundleId)) and (FFlagPurchasePromptFetchCartPricingForLooks or value.itemId ~= tostring(ConstantsModule.BlockyBundleId)) then
					if (not FFlagPurchasePromptFetchCartPricingForLooks or value.selectedInTryOnManager and (LookAssetInfo1.isPurchasable and LookAssetInfo1.quantityOwned <= 0)) and (FFlagPurchasePromptFetchCartPricingForLooks or value.selectedInTryOnManager and LookAssetInfo1.isPurchasable and LookAssetInfo1.quantityOwned <= 0) then
						local PriceInRobux = LookAssetInfo1.priceInRobux
						
						if value.selectedTimedOptionIndex and LookAssetInfo1.timedOptions then
							local TimedOption = LookAssetInfo1.timedOptions[value.selectedTimedOptionIndex]
							
							if TimedOption and TimedOption.days then
								table.insert(List2, {
									itemType = value.itemType,
									itemId = value.itemId,
									days = TimedOption.days
								})
								PriceInRobux = TimedOption.price
							end
						end
						Total += PriceInRobux
						table.insert(List1, (tonumber(value.itemId)))
					elseif value.itemType == ConstantsModule.ItemType.Bundle then
						table.insert(ItemIds1, value.itemId)
					elseif value.itemType == ConstantsModule.ItemType.Asset then
						table.insert(ItemIds, value.itemId)
					end
				end
			end
		end
		local Total1: number = Total
		
		if #List2 > 0 then
			return Total1, ItemIds, ItemIds1, List1, List2
		else
			return Total1, ItemIds, ItemIds1, List1, nil
		end
	end,
	getCartPricingRequestedItemsForLookId = if FFlagPurchasePromptFetchCartPricingForLooks then getCartPricingRequestedItemsForLookId else nil
}