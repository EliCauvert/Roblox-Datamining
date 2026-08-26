local discountType = require(script:FindFirstAncestor("IAPExperience").ProductPurchase.PricingTypes).DiscountType

return function(p1)
	-- upvalues: discountType (ref)
	if not p1 then
		return false
	elseif #p1.discounts >= 2 then
		return true
	end
	for i, v in p1.discounts do
		if v.type == discountType.BlackbirdSubscription or v.type == discountType.RobloxPlusSubscription then
			return true
		end
	end
	return false
end