local discountType = require(script:FindFirstAncestor("IAPExperience").ProductPurchase.PricingTypes).DiscountType

return function(p0) --[[ line: 12 | named "multiItemPriceQualifiesForDetailsDiscountSummary" ]]
	-- upvalues: discountType (ref)
	if not p0 then
		return false
	elseif #p0.discounts >= 2 then
		return true
	end
	for i, v in p0.discounts do
		if v.type == discountType.BlackbirdSubscription or v.type == discountType.RobloxPlusSubscription then
			return true
		end
	end
	return false
end