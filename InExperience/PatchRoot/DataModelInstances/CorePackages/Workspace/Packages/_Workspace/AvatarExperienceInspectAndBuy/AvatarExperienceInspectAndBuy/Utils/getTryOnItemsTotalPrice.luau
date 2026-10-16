local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(Parent.AXCommon)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(AvatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local GetPriceInRobuxFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local GetPriceStatusInShopModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatusInShop)
local IsPurchasableItemFunction = require(AvatarExperienceInspectAndBuy.Utils.bulkPurchaseUtils).isPurchasableItem
local FFlagAXIaBEnableShopContext = require(Parent.AvatarExperienceFlags).FFlagAXIaBEnableShopContext
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = require(Parent.SharedFlags).FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = require(Parent.SharedFlags).FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local config = { isShopContext = true }

local function _(p1, PurchaseFromRoblox) --[[ Line: 52 | Named "getDiscount" ]]
	-- upvalues: PriceStatusModule (copy)
	if PurchaseFromRoblox == PriceStatusModule.PurchaseFromRoblox then
		local DiscountInformation = p1.discountInformation
		
		return if DiscountInformation and DiscountInformation.totalDiscountAmount and DiscountInformation.totalDiscountAmount > 0 then DiscountInformation else nil
	else
		return nil
	end
end

local _ = function(p1): boolean --[[ Line: 68 | Named "isDiscountEligible" ]]
	-- upvalues: FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy)
	return p1 ~= nil and (FIntBlackbirdUpsellMinPriceForDiscountInclusive < p1.originalPrice and (FIntBlackbirdUpsellMaxPriceForDiscountInclusive == 0 or p1.originalPrice < FIntBlackbirdUpsellMaxPriceForDiscountInclusive))
end

local _ = function(p1, p2) --[[ Line: 77 | Named "classifyPriceStatus" ]]
	-- upvalues: FFlagAXIaBEnableShopContext (copy), GetPriceStatusInShopModule (copy), GetPriceStatusModule (copy)
	return if FFlagAXIaBEnableShopContext and p2.isShopContext then GetPriceStatusInShopModule(p1) else GetPriceStatusModule(p1, true)
end

return function(List, p1) --[[ Line: 85 | Named "getTryOnItemsTotalPrice" ]]
	-- upvalues: config (copy), FFlagAXIaBEnableShopContext (copy), GetPriceStatusInShopModule (copy), GetPriceStatusModule (copy), IsPurchasableItemFunction (copy), PriceStatusModule (copy), GetPriceInRobuxFunction (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy)
	local P6 = p1 or config
	local TotalPrice = 0
	local OriginalPrice = 0
	local ItemCount = 0
	local Flag = false
	local Flag1 = false
	
	for _, value in List do
		if value.isEquipped then
			local ItemData = value.itemData
			local PriceStatusInShopModule = if FFlagAXIaBEnableShopContext and P6.isShopContext then GetPriceStatusInShopModule(ItemData) else GetPriceStatusModule(ItemData, true)
			
			if IsPurchasableItemFunction(PriceStatusInShopModule) then
				local PriceInRobux = nil
				if PriceStatusInShopModule == PriceStatusModule.Free then
					PriceInRobux = GetPriceInRobuxFunction(value.itemData, PriceStatusInShopModule) or 0
				else
					local PriceInRobux1 = GetPriceInRobuxFunction(value.itemData, PriceStatusInShopModule)
					
					if PriceInRobux1 ~= nil then
						PriceInRobux = PriceInRobux1
					else
						continue
					end
				end
				local ItemData1 = value.itemData
				local v1 = nil
				
				if PriceStatusInShopModule == PriceStatusModule.PurchaseFromRoblox then
					local DiscountInformation = ItemData1.discountInformation
					v1 = if DiscountInformation and DiscountInformation.totalDiscountAmount and DiscountInformation.totalDiscountAmount > 0 then DiscountInformation else nil
				else
					v1 = nil
				end
				TotalPrice += PriceInRobux
				OriginalPrice += if v1 then v1.originalPrice else PriceInRobux
				
				if v1 ~= nil and (FIntBlackbirdUpsellMinPriceForDiscountInclusive < v1.originalPrice and (FIntBlackbirdUpsellMaxPriceForDiscountInclusive == 0 or FIntBlackbirdUpsellMaxPriceForDiscountInclusive > v1.originalPrice)) then
					Flag = true
				else
					Flag1 = true
				end
				ItemCount += 1
			end
		end
	end
	return {
		totalPrice = TotalPrice,
		originalPrice = OriginalPrice,
		itemCount = ItemCount,
		hasNonDiscountedItems = Flag and Flag1
	}
end