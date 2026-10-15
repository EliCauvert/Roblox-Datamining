local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local _ = require(gifting.Types)
local var1 = tModule.interface({ giftId = giftModelUtilsModule.nonEmptyString })

local function formatPendingGiftItem(p1)
	-- upvalues: tModule (ref), giftModelUtilsModule (ref)
	local var2, var3 = tModule.table(p1)
	
	if not var2 then
		return nil, `item: {var3}`
	end
	local var4, var5 = giftModelUtilsModule.formatItem(p1.item)
	
	if var4 == nil then
		return nil, var5
	end
	return { item = var4, thumbnailUrl = p1.thumbnailUrl or "" }
end

local function formatPendingGift(p1)
	-- upvalues: var1 (ref), giftModelUtilsModule (ref), formatPendingGiftItem (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		return nil, `gift: {var3}`
	end
	local var4, var5 = giftModelUtilsModule.formatGiftSenderInfo(p1.sender)
	
	if var4 == nil then
		return nil, var5
	end
	local items, items_1 = giftModelUtilsModule.formatList("items", p1.items, formatPendingGiftItem)
	
	if items == nil then
		return nil, items_1
	end
	return { giftId = p1.giftId, sender = var4, items = items }
end

return {
	format = function(p1)
		-- upvalues: giftModelUtilsModule (ref), formatPendingGift (ref)
		local gifts, gifts_1 = giftModelUtilsModule.formatList("gifts", p1.gifts or {}, formatPendingGift)
		
		if gifts == nil then
			return nil, gifts_1
		end
		return { gifts = gifts, nextCursor = p1.nextCursor }
	end
}