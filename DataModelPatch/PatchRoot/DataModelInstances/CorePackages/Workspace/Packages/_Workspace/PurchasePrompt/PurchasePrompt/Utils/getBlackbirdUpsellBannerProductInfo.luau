local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.RobloxSubscriptionPurchaseApp)

return function(Entry)
	if type(Entry) ~= "table" or #Entry == 0 then
		return nil
	end
	local Entry1 = Entry[1]
	local IsFreeTrial: boolean = if Entry1.EligibleOffers and Entry1.EligibleOffers[1] then Entry1.EligibleOffers[1].OfferType == "FreeTrial" else false
	local DiscountPercent = nil
	local FeatureConfig = Entry1.ProductTypeDetails and (Entry1.ProductTypeDetails.RobloxSubscriptionProductDetails and Entry1.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig)
	
	if FeatureConfig and FeatureConfig.VirtualTransactionDiscounts then
		local VirtualTransactionDiscount = FeatureConfig.VirtualTransactionDiscounts[1]
		
		if VirtualTransactionDiscount then
			DiscountPercent = VirtualTransactionDiscount.DiscountPercent
		end
	end
	return {
		isFreeTrial = IsFreeTrial,
		initialDiscountPercentage = DiscountPercent
	}
end