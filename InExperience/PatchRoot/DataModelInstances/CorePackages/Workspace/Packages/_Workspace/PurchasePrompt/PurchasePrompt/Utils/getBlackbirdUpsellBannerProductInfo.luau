local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.RobloxSubscriptionPurchaseApp)

return function(p0) --[[ line: 11 | named "getBlackbirdUpsellBannerProductInfo" ]]
	if type(p0) ~= "table" or #p0 == 0 then
		return nil
	end
	local var0 = p0[1]
	local var1 = if var0.EligibleOffers and var0.EligibleOffers[1] then var0.EligibleOffers[1].OfferType == "FreeTrial" else false
	local discountPercent = nil
	local featureConfig = var0.ProductTypeDetails and (var0.ProductTypeDetails.RobloxSubscriptionProductDetails and var0.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig)
	
	if featureConfig and featureConfig.VirtualTransactionDiscounts then
		local var3 = featureConfig.VirtualTransactionDiscounts[1]
		
		if var3 then
			discountPercent = var3.DiscountPercent
		end
	end
	return {
		isFreeTrial = var1,
		initialDiscountPercentage = discountPercent
	}
end