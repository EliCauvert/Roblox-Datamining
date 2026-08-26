local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.RobloxSubscriptionPurchaseApp)

return function(p1)
	if type(p1) ~= "table" or #p1 == 0 then
		return nil
	end
	local var1 = p1[1]
	local var2 = if var1.EligibleOffers and var1.EligibleOffers[1] then var1.EligibleOffers[1].OfferType == "FreeTrial" else false
	local discountPercent = nil
	local featureConfig = var1.ProductTypeDetails and (var1.ProductTypeDetails.RobloxSubscriptionProductDetails and var1.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig)
	
	if featureConfig and featureConfig.VirtualTransactionDiscounts then
		local var3 = featureConfig.VirtualTransactionDiscounts[1]
		
		if var3 then
			discountPercent = var3.DiscountPercent
		end
	end
	return {
		isFreeTrial = var2,
		initialDiscountPercentage = discountPercent
	}
end