local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local _ = require(Gifting.Types)
local InterfaceResult = TModule.interface({
	giftId = GiftModelUtilsModule.nonEmptyString,
	acceptGiftRequest = TModule.any,
	rejectGiftRequest = TModule.any
})

local function formatReceiverPreviewItem(p1) --[[ Line: 35 ]]
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
			name = p1.name or "",
			thumbnailUrl = p1.thumbnailUrl or ""
		}
	end
end

return {
	format = function(p1) --[[ Line: 55 ]]
		-- upvalues: InterfaceResult (copy), GiftModelUtilsModule (copy), formatReceiverPreviewItem (copy)
		local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
		
		if not InterfaceResultResult then
			return nil, InterfaceResultResult2
		end
		local FormatGiftSenderInfoResult, FormatGiftSenderInfoResult2 = GiftModelUtilsModule.formatGiftSenderInfo(p1.sender)
		
		if FormatGiftSenderInfoResult == nil then
			return nil, FormatGiftSenderInfoResult2
		end
		local Items, Items2 = GiftModelUtilsModule.formatList("items", p1.items, formatReceiverPreviewItem)
		
		if Items == nil then
			return nil, Items2
		end
		local FormatUserRelationshipDetailResult, FormatUserRelationshipDetailResult2 = GiftModelUtilsModule.formatUserRelationshipDetail(p1.userRelationshipDetail)
		
		if FormatUserRelationshipDetailResult == nil then
			return nil, FormatUserRelationshipDetailResult2
		else
			return {
				giftId = p1.giftId,
				sender = FormatGiftSenderInfoResult,
				items = Items,
				userRelationshipDetail = FormatUserRelationshipDetailResult,
				acceptGiftRequest = p1.acceptGiftRequest,
				rejectGiftRequest = p1.rejectGiftRequest
			}
		end
	end
}