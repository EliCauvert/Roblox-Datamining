local fFlagPurchasePromptCartPricingEnabledModule = require(script:FindFirstAncestor("PurchasePrompt").Flags.FFlagPurchasePromptCartPricingEnabled)

return function(p1)
	-- upvalues: fFlagPurchasePromptCartPricingEnabledModule (ref)
	if type(p1) ~= "table" or type(p1.discounts) ~= "table" or #p1.discounts == 0 then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p1.discounts) do
		table.insert(t, {
			Type = v.discountCampaign or "",
			AmountInRobux = v.robuxDiscountAmount or 0,
			Percent = v.robuxDiscountPercentage or 0,
			LocalizedDiscountAttribution = if fFlagPurchasePromptCartPricingEnabledModule then v.localizedDiscountAttribution else nil
		})
	end
	return t
end