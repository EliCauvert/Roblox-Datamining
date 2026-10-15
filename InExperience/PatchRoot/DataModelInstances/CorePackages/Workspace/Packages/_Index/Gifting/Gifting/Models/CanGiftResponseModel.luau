local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local giftEligibilityModule = require(gifting.Enums.GiftEligibility)
local requiredActionModule = require(gifting.Enums.RequiredAction)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local _ = require(gifting.Types)
local var1 = tModule.interface({ isGiftable = tModule.boolean })

local function formatItemGiftability(p1)
	-- upvalues: var1 (ref), giftModelUtilsModule (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		return nil, `item giftability: {var3}`
	end
	local var4, var5 = giftModelUtilsModule.formatItem(p1.item)
	
	if var4 == nil then
		return nil, var5
	end
	return { item = var4, isGiftable = p1.isGiftable }
end

return {
	format = function(p1)
		-- upvalues: giftEligibilityModule (ref), giftModelUtilsModule (ref), requiredActionModule (ref), formatItemGiftability (ref)
		local var2 = giftEligibilityModule.fromValue(p1.eligibility)
		
		if var2 == nil then
			return nil, giftModelUtilsModule.invalidField("eligibility", p1.eligibility)
		end
		local var3 = requiredActionModule.fromValues(p1.requiredActions or {})
		
		if var3 == nil then
			return nil, giftModelUtilsModule.invalidField("requiredActions", p1.requiredActions)
		end
		local items, items_1 = giftModelUtilsModule.formatList("items", p1.items or {}, formatItemGiftability)
		
		if items == nil then
			return nil, items_1
		end
		return {
			eligibility = var2,
			requiredActions = var3,
			items = items
		}
	end
}