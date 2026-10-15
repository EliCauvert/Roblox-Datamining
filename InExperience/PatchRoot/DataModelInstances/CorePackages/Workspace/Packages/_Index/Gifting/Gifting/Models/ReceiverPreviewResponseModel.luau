local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local _ = require(gifting.Types)
local var1 = tModule.interface({
	giftId = giftModelUtilsModule.nonEmptyString,
	acceptGiftRequest = tModule.any,
	rejectGiftRequest = tModule.any
})

local function formatReceiverPreviewItem(p1)
	-- upvalues: tModule (ref), giftModelUtilsModule (ref)
	local var2, var3 = tModule.table(p1)
	
	if not var2 then
		return nil, `item: {var3}`
	end
	local var4, var5 = giftModelUtilsModule.formatItem(p1.item)
	
	if var4 == nil then
		return nil, var5
	end
	return {
		item = var4,
		name = p1.name or "",
		thumbnailUrl = p1.thumbnailUrl or ""
	}
end

return {
	format = function(p1)
		-- upvalues: var1 (ref), giftModelUtilsModule (ref), formatReceiverPreviewItem (ref)
		local var2, var3 = var1(p1)
		
		if not var2 then
			return nil, var3
		end
		local var4, var5 = giftModelUtilsModule.formatGiftSenderInfo(p1.sender)
		
		if var4 == nil then
			return nil, var5
		end
		local items, items_1 = giftModelUtilsModule.formatList("items", p1.items, formatReceiverPreviewItem)
		
		if items == nil then
			return nil, items_1
		end
		local var6, var7 = giftModelUtilsModule.formatUserRelationshipDetail(p1.userRelationshipDetail)
		
		if var6 == nil then
			return nil, var7
		end
		return {
			giftId = p1.giftId,
			sender = var4,
			items = items,
			userRelationshipDetail = var6,
			acceptGiftRequest = p1.acceptGiftRequest,
			rejectGiftRequest = p1.rejectGiftRequest
		}
	end
}