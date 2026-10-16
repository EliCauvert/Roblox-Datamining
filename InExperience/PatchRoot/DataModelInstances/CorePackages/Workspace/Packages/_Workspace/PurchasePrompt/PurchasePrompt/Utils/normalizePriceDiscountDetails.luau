local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local DiscountType = require(PurchasePrompt.Parent.IAPExperience).DiscountType
local FFlagNormalizePriceDiscountAcceptLowercaseModule = require(PurchasePrompt.Flags.FFlagNormalizePriceDiscountAcceptLowercase)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local config = {
	[DiscountType.BlackbirdSubscription] = true,
	[DiscountType.RobloxPlusSubscription] = true
}

local function isValidRawDiscount(p1): boolean --[[ Line: 16 ]]
	-- upvalues: FFlagNormalizePriceDiscountAcceptLowercaseModule (copy)
	if type(p1) ~= "table" then
		return false
	end
	if FFlagNormalizePriceDiscountAcceptLowercaseModule then
		local Type = p1.Type or p1.type
		local AmountInRobux = p1.AmountInRobux or p1.amountInRobux
		local Percent = p1.Percent or p1.percent
		
		if type(Type) ~= "string" or Type == "" then
			return false
		elseif type(AmountInRobux) ~= "number" then
			return false
		elseif type(Percent) ~= "number" then
			return false
		end
	elseif type(p1.Type) ~= "string" or p1.Type == "" then
		return false
	elseif type(p1.AmountInRobux) ~= "number" then
		return false
	elseif type(p1.Percent) ~= "number" then
		return false
	end
	return true
end

return function(List) --[[ Line: 50 | Named "normalizePriceDiscountDetails" ]]
	-- upvalues: isValidRawDiscount (copy), FFlagNormalizePriceDiscountAcceptLowercaseModule (copy), config (copy), DiscountType (copy), FFlagPurchasePromptCartPricingEnabledModule (copy)
	if type(List) ~= "table" or #List == 0 then
		return {}
	end
	local List1 = {}
	
	for _, value in ipairs(List) do
		if not isValidRawDiscount(value) then
			return {}
		end
		if FFlagNormalizePriceDiscountAcceptLowercaseModule then
			local Type = value.Type or value.type
			table.insert(List1, {
				type = if config[Type] then Type else DiscountType.Uncategorized,
				amountInRobux = value.AmountInRobux or value.amountInRobux,
				percent = value.Percent or value.percent,
				localizedDiscountAttribution = if FFlagPurchasePromptCartPricingEnabledModule then value.LocalizedDiscountAttribution else nil
			})
		else
			table.insert(List1, {
				type = if config[value.Type] then value.Type else DiscountType.Uncategorized,
				amountInRobux = value.AmountInRobux,
				percent = value.Percent,
				localizedDiscountAttribution = if FFlagPurchasePromptCartPricingEnabledModule then value.LocalizedDiscountAttribution else nil
			})
		end
	end
	return List1
end