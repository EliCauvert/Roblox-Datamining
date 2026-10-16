local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local _ = require(Gifting.Types)
local InterfaceResult = TModule.interface({ giftId = GiftModelUtilsModule.nonEmptyString })

local function formatPendingGiftItem(p1) --[[ Line: 32 ]]
	-- upvalues: TModule (copy), GiftModelUtilsModule (copy)
	local v1, v2 = TModule.table(p1)
	
	if not v1 then
		return nil, `item: {v2}`
	end
	local FormatItemResult, FormatItemResult2 = GiftModelUtilsModule.formatItem(p1.item)
	
	if FormatItemResult == nil then
		return nil, FormatItemResult2
	else
		return {
			item = FormatItemResult,
			thumbnailUrl = p1.thumbnailUrl or ""
		}
	end
end

local function formatPendingGift(p1) --[[ Line: 49 ]]
	-- upvalues: InterfaceResult (copy), GiftModelUtilsModule (copy), formatPendingGiftItem (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, `gift: {InterfaceResultResult2}`
	end
	local FormatGiftSenderInfoResult, FormatGiftSenderInfoResult2 = GiftModelUtilsModule.formatGiftSenderInfo(p1.sender)
	
	if FormatGiftSenderInfoResult == nil then
		return nil, FormatGiftSenderInfoResult2
	end
	local Items, Items2 = GiftModelUtilsModule.formatList("items", p1.items, formatPendingGiftItem)
	
	if Items == nil then
		return nil, Items2
	else
		return {
			giftId = p1.giftId,
			sender = FormatGiftSenderInfoResult,
			items = Items
		}
	end
end

return {
	format = function(p1) --[[ Line: 74 ]]
		-- upvalues: GiftModelUtilsModule (copy), formatPendingGift (copy)
		local Gifts, Gifts2 = GiftModelUtilsModule.formatList("gifts", p1.gifts or {}, formatPendingGift)
		
		if Gifts == nil then
			return nil, Gifts2
		else
			return { gifts = Gifts, nextCursor = p1.nextCursor }
		end
	end
}