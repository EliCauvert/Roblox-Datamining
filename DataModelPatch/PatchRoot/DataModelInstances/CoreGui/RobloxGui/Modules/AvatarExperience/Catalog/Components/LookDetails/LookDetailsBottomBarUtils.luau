local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.Reducers.Looks)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesItemInfo)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellableInstances)
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local HideLookDiscountPercentWithIneligibleItems = game:DefineFastFlag("HideLookDiscountPercentWithIneligibleItems", false)
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local LookDetailsBottomBarUtils = {
	getItemInfo = function(Id, ItemType, p1, p2)
		-- upvalues: ConstantsModule (copy)
		if not p1 or not p2 then
			return nil
		end
		local v1 = p1[p2]
		
		if not v1 then
			return nil
		elseif ItemType == ConstantsModule.ItemType.Asset then
			return v1.lookAssetInfos[Id]
		elseif ItemType == ConstantsModule.ItemType.Bundle then
			local LookBundleInfos = v1.lookBundleInfos
			
			return if LookBundleInfos then LookBundleInfos[Id] else nil
		else
			return nil
		end
	end
}

function LookDetailsBottomBarUtils.getOwnedTryOnItems(List, p1, p2)
	-- upvalues: LookDetailsBottomBarUtils (copy)
	local t = {}
	
	for i, value in List do
		if value.selectedInTryOnManager then
			local ItemInfo = LookDetailsBottomBarUtils.getItemInfo(value.itemId, value.itemType, p1, p2)
			
			if ItemInfo and ItemInfo.quantityOwned > 0 then
				t[i] = value
			end
		end
	end
	return t
end

function LookDetailsBottomBarUtils.getPriceForItem(ItemInfo, p3, p4, p5, SelectedTimedOptionIndex)
	-- upvalues: CatalogUtilsModule (copy)
	local PriceInRobux = ItemInfo.priceInRobux
	
	if SelectedTimedOptionIndex and ItemInfo.timedOptions then
		local TimedOption = ItemInfo.timedOptions[SelectedTimedOptionIndex]
		
		if TimedOption then
			PriceInRobux = TimedOption.price
		end
	end
	if ItemInfo.collectibleItemId then
		local CheapestCollectiblePurchaseInfoV2 = CatalogUtilsModule.findCheapestCollectiblePurchaseInfoV2(ItemInfo.collectibleItemId, CatalogUtilsModule.IsResellable(ItemInfo), p3, p4, p5)
		
		if CheapestCollectiblePurchaseInfoV2.price then
			PriceInRobux = CheapestCollectiblePurchaseInfoV2.price
		end
	end
	return PriceInRobux
end

if FFlagAXMISEnableMultiShopping then
	function LookDetailsBottomBarUtils.getBottomBarInfoMIS(List, p3, p4, p5, p6, p7, List1)
		-- upvalues: HideLookDiscountPercentWithIneligibleItems (copy), LookDetailsBottomBarUtils (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), CryoModule (copy)
		local Count = 0
		local Count1 = 0
		local Total = 0
		local NewOriginalPrice = 0
		local Flag = false
		local JoinResults = {}
		local Flag1 = false
		local Flag2 = false
		
		if p7 then
			local SelectedTimedOptionIndex = nil
			local v1 = nil
			for _, value in List do
				Count += 1
				local ItemInfo = LookDetailsBottomBarUtils.getItemInfo(value.id, value.itemType, p6, p7)
				
				if ItemInfo then
					if not ItemInfo or not ItemInfo.quantityOwned or ItemInfo.quantityOwned <= 0 then
						SelectedTimedOptionIndex = nil
						v1 = nil
						
						if List1 then
							for _, value1 in List1 do
								if value1.itemId == value.id and value1.itemType == value.itemType then
									v1 = value1
									SelectedTimedOptionIndex = value1.selectedTimedOptionIndex
									break
								end
							end
						end
						local PriceForItem: number = LookDetailsBottomBarUtils.getPriceForItem(ItemInfo, p3, p4, p5, SelectedTimedOptionIndex)
						
						if PriceForItem ~= nil then
							Total += PriceForItem
							Count1 += 1
							local OriginalPrice = if ItemInfo and ItemInfo.discountInformation then ItemInfo.discountInformation.originalPrice else PriceForItem
							
							if ItemInfo and ItemInfo.discountInformation and not (OriginalPrice <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or FIntBlackbirdUpsellMaxPriceForDiscountInclusive ~= 0 and OriginalPrice >= FIntBlackbirdUpsellMaxPriceForDiscountInclusive) then
								Flag1 = true
							else
								Flag2 = true
							end
							if ItemInfo and ItemInfo.discountInformation then
								NewOriginalPrice += ItemInfo.discountInformation.originalPrice
							else
								NewOriginalPrice += PriceForItem
							end
							if v1 then
								JoinResults[value.id] = CryoModule.Dictionary.join(v1, { expectedPrice = PriceForItem })
							end
						end
					end
				elseif not Flag then
					Flag = true
				end
			end
			local Total2: number = Total
			local Count4: number = Count
			local Count2: number = Count1
			local Flag4: boolean = Flag
			local NewOriginalPrice2: number = NewOriginalPrice
			
			if HideLookDiscountPercentWithIneligibleItems then
				return Total2, Count4, Count2, Flag4, JoinResults, NewOriginalPrice2, Flag1 and Flag2
			else
				return Total2, Count4, Count2, Flag4, JoinResults, NewOriginalPrice2, nil
			end
		else
			local Total1: number = Total
			local Count2: number = Count
			local Count3: number = Count1
			local Flag3: boolean = Flag
			local v2 = nil
			local NewOriginalPrice1: number = NewOriginalPrice
			
			if HideLookDiscountPercentWithIneligibleItems then
				return Total1, Count2, Count3, Flag3, v2, NewOriginalPrice1, false
			else
				return Total1, Count2, Count3, Flag3, v2, NewOriginalPrice1, nil
			end
		end
	end
	
	function LookDetailsBottomBarUtils.getOwnedItemsInLook(List, p8, p9)
		-- upvalues: LookDetailsBottomBarUtils (copy)
		local t = {}
		
		for i, value in List do
			local ItemInfo = if value.itemType then LookDetailsBottomBarUtils.getItemInfo(value.id, value.itemType, p8, p9) else nil
			
			if ItemInfo and ItemInfo.quantityOwned > 0 then
				t[i] = value
			end
		end
		return t
	end
end
return LookDetailsBottomBarUtils