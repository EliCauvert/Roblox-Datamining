local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local discountType = require(purchasePrompt.Parent.IAPExperience).DiscountType
local fFlagNormalizePriceDiscountAcceptLowercaseModule = require(purchasePrompt.Flags.FFlagNormalizePriceDiscountAcceptLowercase)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local t = {
	[discountType.BlackbirdSubscription] = true,
	[discountType.RobloxPlusSubscription] = true
}

local function isValidRawDiscount(p0)
	-- upvalues: fFlagNormalizePriceDiscountAcceptLowercaseModule (ref)
	if type(p0) ~= "table" then
		return false
	elseif fFlagNormalizePriceDiscountAcceptLowercaseModule then
		local type = p0.Type or p0.type
		local amountInRobux = p0.AmountInRobux or p0.amountInRobux
		local percent = p0.Percent or p0.percent
		
		if type(type) ~= "string" or type == "" then
			return false
		elseif type(amountInRobux) ~= "number" then
			return false
		elseif type(percent) == "number" then
		else
			return false
		end
	else
		return not (type(p0.Type) ~= "string" or p0.Type == "") and (type(p0.AmountInRobux) == "number" and type(p0.Percent) == "number")
	end
end

return function(p1)
	-- upvalues: isValidRawDiscount (ref), fFlagNormalizePriceDiscountAcceptLowercaseModule (ref), t (ref), discountType (ref), fFlagPurchasePromptCartPricingEnabledModule (ref)
	if type(p1) ~= "table" or #p1 == 0 then
		return {}
	end
	local t_1 = {}
	
	for i, v in ipairs(p1) do
		if isValidRawDiscount(v) then
			if fFlagNormalizePriceDiscountAcceptLowercaseModule then
				local type = v.Type or v.type
				table.insert(t_1, {
					type = if t[type] then type else discountType.Uncategorized,
					amountInRobux = v.AmountInRobux or v.amountInRobux,
					percent = v.Percent or v.percent,
					localizedDiscountAttribution = if fFlagPurchasePromptCartPricingEnabledModule then v.LocalizedDiscountAttribution else nil
				})
			else
				table.insert(t_1, {
					type = if t[v.Type] then v.Type else discountType.Uncategorized,
					amountInRobux = v.AmountInRobux,
					percent = v.Percent,
					localizedDiscountAttribution = if fFlagPurchasePromptCartPricingEnabledModule then v.LocalizedDiscountAttribution else nil
				})
			end
		end
		return {}
	end
	return t_1
end