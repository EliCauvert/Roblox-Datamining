local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local _ = require(Gifting.Types)
local InterfaceResult = TModule.interface({ priceInRobux = TModule.number })
local InterfaceResult1 = TModule.interface({
	robuxDiscountAmount = TModule.number,
	robuxDiscountPercentage = TModule.number
})
local InterfaceResult2 = TModule.interface({
	originalPrice = TModule.number,
	totalDiscountPercentage = TModule.number,
	totalDiscountAmount = TModule.number
})
local InterfaceResult3 = TModule.interface({ userId = TModule.number })
local InterfaceResult4 = TModule.interface({
	remaining = TModule.number,
	granted = TModule.number,
	startTimeMs = TModule.number,
	endTimeMs = TModule.number
})
local InterfaceResult5 = TModule.interface({
	purchaseGiftRequest = TModule.any,
	totalPriceInRobux = TModule.number,
	senderRobuxBalance = TModule.number
})

local function formatItemDetail(p1)
	-- upvalues: InterfaceResult (copy), GiftModelUtilsModule (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, `item: {InterfaceResultResult2}`
	end
	local FormatItemResult, FormatItemResult2 = GiftModelUtilsModule.formatItem(p1.item)
	
	if FormatItemResult == nil then
		return nil, FormatItemResult2
	else
		return {
			item = FormatItemResult,
			name = p1.name or "",
			thumbnailUrl = p1.thumbnailUrl or "",
			priceInRobux = p1.priceInRobux
		}
	end
end

local function formatDiscountDetail(p1)
	-- upvalues: InterfaceResult1 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult1(p1)
	
	if InterfaceResultResult then
		return {
			robuxDiscountAmount = p1.robuxDiscountAmount,
			robuxDiscountPercentage = p1.robuxDiscountPercentage,
			discountCampaign = p1.discountCampaign or "",
			localizedDiscountAttribution = p1.localizedDiscountAttribution or ""
		}
	else
		return nil, `discount: {InterfaceResultResult2}`
	end
end

local function formatDiscountInformation(DiscountInformation)
	-- upvalues: InterfaceResult2 (copy), GiftModelUtilsModule (copy), formatDiscountDetail (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult2(DiscountInformation)
	
	if not InterfaceResultResult then
		return nil, `discountInformation: {InterfaceResultResult2}`
	end
	local Discounts, Discounts2 = GiftModelUtilsModule.formatList("discounts", DiscountInformation.discounts or {}, formatDiscountDetail)
	
	if Discounts == nil then
		return nil, Discounts2
	else
		return {
			originalPrice = DiscountInformation.originalPrice,
			totalDiscountPercentage = DiscountInformation.totalDiscountPercentage,
			totalDiscountAmount = DiscountInformation.totalDiscountAmount,
			discounts = Discounts
		}
	end
end

local function _(p1)
	-- upvalues: InterfaceResult3 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult3(p1)
	
	if InterfaceResultResult then
		return {
			userId = p1.userId,
			displayName = p1.displayName or "",
			thumbnailUrl = p1.thumbnailUrl or ""
		}
	else
		return nil, `recipient: {InterfaceResultResult2}`
	end
end

local _ = function(p1)
	-- upvalues: InterfaceResult4 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult4(p1)
	
	if InterfaceResultResult then
		return {
			remaining = p1.remaining,
			granted = p1.granted,
			startTimeMs = p1.startTimeMs,
			endTimeMs = p1.endTimeMs
		}
	else
		return nil, `freeAllowance: {InterfaceResultResult2}`
	end
end

return {
	format = function(p1)
		-- upvalues: InterfaceResult5 (copy), GiftModelUtilsModule (copy), formatItemDetail (copy), InterfaceResult3 (copy), formatDiscountInformation (copy), InterfaceResult4 (copy)
		local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult5(p1)
		
		if not InterfaceResultResult then
			return nil, InterfaceResultResult2
		end
		local Items, Items2 = GiftModelUtilsModule.formatList("items", p1.items, formatItemDetail)
		
		if Items == nil then
			return nil, Items2
		end
		local Recipient = p1.recipient
		local InterfaceResultResult1, InterfaceResultResult2_1 = InterfaceResult3(Recipient)
		local Recipient1 = nil
		local RecipientName = nil
		
		if InterfaceResultResult1 then
			Recipient1 = {
				userId = Recipient.userId,
				displayName = Recipient.displayName or "",
				thumbnailUrl = Recipient.thumbnailUrl or ""
			}
			RecipientName = nil
		else
			Recipient1 = nil
			RecipientName = `recipient: {InterfaceResultResult2_1}`
		end
		if Recipient1 == nil then
			return nil, RecipientName
		end
		local FormatUserRelationshipDetailResult, FormatUserRelationshipDetailResult2 = GiftModelUtilsModule.formatUserRelationshipDetail(p1.userRelationshipDetail)
		
		if FormatUserRelationshipDetailResult == nil then
			return nil, FormatUserRelationshipDetailResult2
		end
		local DiscountInformation = nil
		
		if p1.discountInformation ~= nil then
			local FormatDiscountInformationResult2
			DiscountInformation, FormatDiscountInformationResult2 = formatDiscountInformation(p1.discountInformation)
			
			if DiscountInformation == nil then
				return nil, FormatDiscountInformationResult2
			end
		end
		local FreeAllowance = nil
		
		if p1.freeAllowance ~= nil then
			local FreeAllowance1 = p1.freeAllowance
			local InterfaceResultResult3, InterfaceResultResult2_2 = InterfaceResult4(FreeAllowance1)
			local v1 = nil
			local FreeAllowanceName = nil
			
			if InterfaceResultResult3 then
				v1 = {
					remaining = FreeAllowance1.remaining,
					granted = FreeAllowance1.granted,
					startTimeMs = FreeAllowance1.startTimeMs,
					endTimeMs = FreeAllowance1.endTimeMs
				}
				FreeAllowanceName = nil
			else
				v1 = nil
				FreeAllowanceName = `freeAllowance: {InterfaceResultResult2_2}`
			end
			FreeAllowance = v1
			local FreeAllowanceName1: string = FreeAllowanceName
			
			if FreeAllowance == nil then
				return nil, FreeAllowanceName1
			end
		end
		return {
			purchaseGiftRequest = p1.purchaseGiftRequest,
			items = Items,
			totalPriceInRobux = p1.totalPriceInRobux,
			discountInformation = DiscountInformation,
			senderRobuxBalance = p1.senderRobuxBalance,
			recipient = Recipient1,
			userRelationshipDetail = FormatUserRelationshipDetailResult,
			freeAllowance = FreeAllowance
		}
	end
}