local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local _ = require(gifting.Types)
local var1 = tModule.interface({ priceInRobux = tModule.number })
local var2 = tModule.interface({
	robuxDiscountAmount = tModule.number,
	robuxDiscountPercentage = tModule.number
})
local var3 = tModule.interface({
	originalPrice = tModule.number,
	totalDiscountPercentage = tModule.number,
	totalDiscountAmount = tModule.number
})
local var4 = tModule.interface({ userId = tModule.number })
local var5 = tModule.interface({
	remaining = tModule.number,
	granted = tModule.number,
	startTimeMs = tModule.number,
	endTimeMs = tModule.number
})
local var6 = tModule.interface({
	purchaseGiftRequest = tModule.any,
	totalPriceInRobux = tModule.number,
	senderRobuxBalance = tModule.number
})

local function formatItemDetail(p1)
	-- upvalues: var1 (ref), giftModelUtilsModule (ref)
	local var7, var8 = var1(p1)
	
	if not var7 then
		return nil, `item: {var8}`
	end
	local var9, var10 = giftModelUtilsModule.formatItem(p1.item)
	
	if var9 == nil then
		return nil, var10
	end
	return {
		item = var9,
		name = p1.name or "",
		thumbnailUrl = p1.thumbnailUrl or "",
		priceInRobux = p1.priceInRobux
	}
end

local function formatDiscountDetail(p1)
	-- upvalues: var2 (ref)
	local var7, var8 = var2(p1)
	
	if var7 then
		return {
			robuxDiscountAmount = p1.robuxDiscountAmount,
			robuxDiscountPercentage = p1.robuxDiscountPercentage,
			discountCampaign = p1.discountCampaign or "",
			localizedDiscountAttribution = p1.localizedDiscountAttribution or ""
		}
	end
	return nil, `discount: {var8}`
end

local function formatDiscountInformation(p1)
	-- upvalues: var3 (ref), giftModelUtilsModule (ref), formatDiscountDetail (ref)
	local var7, var8 = var3(p1)
	
	if not var7 then
		return nil, `discountInformation: {var8}`
	end
	local discounts, discounts_1 = giftModelUtilsModule.formatList("discounts", p1.discounts or {}, formatDiscountDetail)
	
	if discounts == nil then
		return nil, discounts_1
	end
	return {
		originalPrice = p1.originalPrice,
		totalDiscountPercentage = p1.totalDiscountPercentage,
		totalDiscountAmount = p1.totalDiscountAmount,
		discounts = discounts
	}
end

local function _(p1)
	-- upvalues: var4 (ref)
	local var7, var8 = var4(p1)
	
	if var7 then
		return {
			userId = p1.userId,
			displayName = p1.displayName or "",
			thumbnailUrl = p1.thumbnailUrl or ""
		}
	end
	return nil, `recipient: {var8}`
end

local _ = function(p1)
	-- upvalues: var5 (ref)
	local var7, var8 = var5(p1)
	
	if var7 then
		return {
			remaining = p1.remaining,
			granted = p1.granted,
			startTimeMs = p1.startTimeMs,
			endTimeMs = p1.endTimeMs
		}
	end
	return nil, `freeAllowance: {var8}`
end

return {
	format = function(p1)
		-- upvalues: var6 (ref), giftModelUtilsModule (ref), formatItemDetail (ref), var4 (ref), formatDiscountInformation (ref), var5 (ref)
		local var7, var8 = var6(p1)
		
		if not var7 then
			return nil, var8
		end
		local items, items_1 = giftModelUtilsModule.formatList("items", p1.items, formatItemDetail)
		
		if items == nil then
			return nil, items_1
		end
		local t, var9
		local recipient = p1.recipient
		local var10, var11 = var4(recipient)
		
		if var10 then
			t = {
				userId = recipient.userId,
				displayName = recipient.displayName or "",
				thumbnailUrl = recipient.thumbnailUrl or ""
			}
			var9 = nil
		else
			t = nil
			var9 = `recipient: {var11}`
		end
		if t == nil then
			return nil, var9
		end
		local var12, var13 = giftModelUtilsModule.formatUserRelationshipDetail(p1.userRelationshipDetail)
		
		if var12 == nil then
			return nil, var13
		end
		local var14 = nil
		
		if p1.discountInformation ~= nil then
			local _ = nil
			local var15, var16 = formatDiscountInformation(p1.discountInformation)
			var14 = var15
			local var17 = var16
			
			if var14 == nil then
				return nil, var17
			end
		end
		local var18 = nil
		
		if p1.freeAllowance ~= nil then
			local t_1, var19
			local _ = nil
			local freeAllowance = p1.freeAllowance
			local var20, var21 = var5(freeAllowance)
			
			if var20 then
				t_1 = {
					remaining = freeAllowance.remaining,
					granted = freeAllowance.granted,
					startTimeMs = freeAllowance.startTimeMs,
					endTimeMs = freeAllowance.endTimeMs
				}
				var19 = nil
			else
				t_1 = nil
				var19 = `freeAllowance: {var21}`
			end
			var18 = t_1
			local var22 = var19
			
			if var18 == nil then
				return nil, var22
			end
		end
		return {
			purchaseGiftRequest = p1.purchaseGiftRequest,
			items = items,
			totalPriceInRobux = p1.totalPriceInRobux,
			discountInformation = var14,
			senderRobuxBalance = p1.senderRobuxBalance,
			recipient = t,
			userRelationshipDetail = var12,
			freeAllowance = var18
		}
	end
}