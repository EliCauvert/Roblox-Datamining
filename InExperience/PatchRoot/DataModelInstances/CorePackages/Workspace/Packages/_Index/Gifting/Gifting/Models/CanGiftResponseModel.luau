local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local GiftEligibilityModule = require(Gifting.Enums.GiftEligibility)
local RequiredActionModule = require(Gifting.Enums.RequiredAction)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local _ = require(Gifting.Types)
local InterfaceResult = TModule.interface({ isGiftable = TModule.boolean })

local function formatItemGiftability(p1)
	-- upvalues: InterfaceResult (copy), GiftModelUtilsModule (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, `item giftability: {InterfaceResultResult2}`
	end
	local FormatItemResult, FormatItemResult2 = GiftModelUtilsModule.formatItem(p1.item)
	
	if FormatItemResult == nil then
		return nil, FormatItemResult2
	else
		return { item = FormatItemResult, isGiftable = p1.isGiftable }
	end
end

return {
	format = function(p1)
		-- upvalues: GiftEligibilityModule (copy), GiftModelUtilsModule (copy), RequiredActionModule (copy), formatItemGiftability (copy)
		local FromValueResult = GiftEligibilityModule.fromValue(p1.eligibility)
		
		if FromValueResult == nil then
			return nil, GiftModelUtilsModule.invalidField("eligibility", p1.eligibility)
		end
		local FromValuesResult = RequiredActionModule.fromValues(p1.requiredActions or {})
		
		if FromValuesResult == nil then
			return nil, GiftModelUtilsModule.invalidField("requiredActions", p1.requiredActions)
		end
		local Items, Items2 = GiftModelUtilsModule.formatList("items", p1.items or {}, formatItemGiftability)
		
		if Items == nil then
			return nil, Items2
		else
			return {
				eligibility = FromValueResult,
				requiredActions = FromValuesResult,
				items = Items
			}
		end
	end
}