local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(parent.AXCommon)
local _ = require(avatarExperienceInspectAndBuy.Types)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local getPriceInRobux = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local getPriceStatusInShopModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatusInShop)
local isPurchasableItem = require(avatarExperienceInspectAndBuy.Utils.bulkPurchaseUtils).isPurchasableItem
local fFlagAXIaBEnableShopContext = require(parent.AvatarExperienceFlags).FFlagAXIaBEnableShopContext
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = require(parent.SharedFlags).FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = require(parent.SharedFlags).FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local t = { isShopContext = true }

local function _(p1, p2)
	-- upvalues: priceStatusModule (ref)
	if p2 ~= priceStatusModule.PurchaseFromRoblox then
		return nil
	end
	local discountInformation = p1.discountInformation
	
	return if discountInformation and discountInformation.totalDiscountAmount and discountInformation.totalDiscountAmount > 0 then discountInformation else nil
end

local _ = function(p1)
	-- upvalues: fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref)
	return if p1 == nil then false else fIntBlackbirdUpsellMinPriceForDiscountInclusive < p1.originalPrice and (if fIntBlackbirdUpsellMaxPriceForDiscountInclusive ~= 0 then p1.originalPrice < fIntBlackbirdUpsellMaxPriceForDiscountInclusive else true)
end

local _ = function(p1, p2)
	-- upvalues: fFlagAXIaBEnableShopContext (ref), getPriceStatusInShopModule (ref), getPriceStatusModule (ref)
	return if fFlagAXIaBEnableShopContext and p2.isShopContext then getPriceStatusInShopModule(p1) else getPriceStatusModule(p1, true)
end

return function(p1, p2)
	-- upvalues: t (ref), fFlagAXIaBEnableShopContext (ref), getPriceStatusInShopModule (ref), getPriceStatusModule (ref), isPurchasableItem (ref), priceStatusModule (ref), getPriceInRobux (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref)
	p2 = p2 or t
	local var1 = 0
	local var2 = 0
	local var3 = 0
	local var4 = false
	local var5 = false
	
	for i, v in p1 do
		if v.isEquipped then
			local itemData = v.itemData
			local var6 = if fFlagAXIaBEnableShopContext and p2.isShopContext then getPriceStatusInShopModule(itemData) else getPriceStatusModule(itemData, true)
			
			if isPurchasableItem(var6) then
				local itemData_1, var7
				local _ = nil
				
				if var6 == priceStatusModule.Free then
					itemData_1 = getPriceInRobux(v.itemData, var6) or 0
				else
					var7 = getPriceInRobux(v.itemData, var6)
					
					if var7 ~= nil then
						itemData_1 = var7
					end
				end
				local discountInformation
				local itemData_2 = v.itemData
				
				if var6 == priceStatusModule.PurchaseFromRoblox then
					discountInformation = itemData_2.discountInformation
					var7 = if discountInformation and discountInformation.totalDiscountAmount and discountInformation.totalDiscountAmount > 0 then discountInformation else nil
				else
					var7 = nil
				end
				local var8
				var1 += itemData_1
				var2 += if var7 then var7.originalPrice else itemData_1
				
				if var7 == nil then
					var8 = false
				else
					discountInformation = fIntBlackbirdUpsellMaxPriceForDiscountInclusive
					var8 = fIntBlackbirdUpsellMinPriceForDiscountInclusive < var7.originalPrice and (if discountInformation ~= 0 then var7.originalPrice < discountInformation else true)
				end
				if var8 then
					var4 = true
				else
					var5 = true
				end
				var3 += 1
			end
		end
	end
	return {
		totalPrice = var1,
		originalPrice = var2,
		itemCount = var3,
		hasNonDiscountedItems = var4 and var5
	}
end