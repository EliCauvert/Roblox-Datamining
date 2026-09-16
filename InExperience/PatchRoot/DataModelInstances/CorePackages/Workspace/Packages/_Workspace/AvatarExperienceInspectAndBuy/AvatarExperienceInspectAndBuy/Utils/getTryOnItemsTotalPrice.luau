local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local getPriceInRobux = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local getPriceStatusInShopModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatusInShop)
local isPurchasableItem = require(avatarExperienceInspectAndBuy.Utils.bulkPurchaseUtils).isPurchasableItem
local fFlagAXIaBEnableShopContext = require(parent.AvatarExperienceFlags).FFlagAXIaBEnableShopContext
local t = { isShopContext = true }

local function _(p1, p2)
	-- upvalues: fFlagAXIaBEnableShopContext (ref), getPriceStatusInShopModule (ref), getPriceStatusModule (ref)
	return if fFlagAXIaBEnableShopContext and p2.isShopContext then getPriceStatusInShopModule(p1) else getPriceStatusModule(p1, true)
end

return function(p1, p2)
	-- upvalues: t (ref), fFlagAXIaBEnableShopContext (ref), getPriceStatusInShopModule (ref), getPriceStatusModule (ref), isPurchasableItem (ref), priceStatusModule (ref), getPriceInRobux (ref)
	p2 = p2 or t
	local var1 = 0
	local var2 = 0
	
	for i, v in p1 do
		if v.isEquipped then
			local itemData = v.itemData
			local var3 = if fFlagAXIaBEnableShopContext and p2.isShopContext then getPriceStatusInShopModule(itemData) else getPriceStatusModule(itemData, true)
			
			if isPurchasableItem(var3) then
				local itemData_1
				local _ = nil
				
				if var3 == priceStatusModule.Free then
					itemData_1 = getPriceInRobux(v.itemData, var3) or 0
					var1 += itemData_1
					var2 += 1
				else
					local var4 = getPriceInRobux(v.itemData, var3)
					
					if var4 ~= nil then
						itemData_1 = var4
					end
				end
			end
		end
	end
	return { totalPrice = var1, itemCount = var2 }
end