local DiscountType = require(script:FindFirstAncestor("IAPExperience").ProductPurchase.PricingTypes).DiscountType

return function(p1): boolean --[[ Line: 12 | Named "multiItemPriceQualifiesForDetailsDiscountSummary" ]]
	-- upvalues: DiscountType (copy)
	if not p1 then
		return false
	end
	if #p1.discounts >= 2 then
		return true
	end
	for _, discount in p1.discounts do
		if discount.type == DiscountType.BlackbirdSubscription or discount.type == DiscountType.RobloxPlusSubscription then
			return true
		end
	end
	return false
end