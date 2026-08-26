local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.IAPExperience)
local fFlagFixResaleDisplayPriceModule = require(purchasePrompt.Flags.FFlagFixResaleDisplayPrice)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagAXFixMISUpsellDiscountSummary = sharedFlagsModule.FFlagAXFixMISUpsellDiscountSummary
local selectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p1)
	-- upvalues: fFlagFixResaleDisplayPriceModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectCartPricingOverrideModule (ref), fFlagAXFixMISUpsellDiscountSummary (ref)
	local productInfo = p1.productInfo
	local price = productInfo.price or 0
	local basePrice = productInfo.basePrice or price
	local priceDiscountDetails = productInfo.priceDiscountDetails or {}
	
	if fFlagFixResaleDisplayPriceModule and p1.promptRequest then
		local collectibleItemInstanceId = p1.promptRequest.collectibleItemInstanceId
		
		if collectibleItemInstanceId and collectibleItemInstanceId ~= "" then
			local expectedPrice = p1.promptRequest.expectedPrice
			
			if expectedPrice ~= nil then
				price = expectedPrice
				basePrice = expectedPrice
			end
		end
	end
	if fFlagPurchasePromptCartPricingEnabledModule then
		local var1 = selectCartPricingOverrideModule(p1)
		
		if var1 ~= nil then
			price = var1.priceInRobux
			
			if var1.basePriceInRobux ~= nil then
				basePrice = var1.basePriceInRobux
			end
		end
	end
	return {
		priceInRobux = price,
		basePriceInRobux = basePrice,
		discounts = priceDiscountDetails,
		savingsSummaryOverride = if fFlagAXFixMISUpsellDiscountSummary then productInfo.savingsSummaryOverride else nil
	}
end