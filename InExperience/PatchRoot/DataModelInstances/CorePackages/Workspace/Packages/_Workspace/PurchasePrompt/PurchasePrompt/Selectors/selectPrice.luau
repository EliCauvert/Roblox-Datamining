local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local _ = require(Parent.IAPExperience)
local FFlagFixResaleDisplayPriceModule = require(PurchasePrompt.Flags.FFlagFixResaleDisplayPrice)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local FFlagAXFixMISUpsellDiscountSummary = require(Parent.SharedFlags).FFlagAXFixMISUpsellDiscountSummary
local SelectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p1) --[[ Line: 33 | Named "selectPrice" ]]
	-- upvalues: FFlagFixResaleDisplayPriceModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), SelectCartPricingOverrideModule (copy), FFlagAXFixMISUpsellDiscountSummary (copy)
	local ProductInfo = p1.productInfo
	local Price = ProductInfo.price or 0
	local BasePrice = ProductInfo.basePrice or Price
	local PriceDiscountDetails = ProductInfo.priceDiscountDetails or {}
	
	if FFlagFixResaleDisplayPriceModule and p1.promptRequest then
		local CollectibleItemInstanceId = p1.promptRequest.collectibleItemInstanceId
		
		if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
			local ExpectedPrice = p1.promptRequest.expectedPrice
			
			if ExpectedPrice ~= nil then
				Price = ExpectedPrice
				BasePrice = ExpectedPrice
			end
		end
	end
	if FFlagPurchasePromptCartPricingEnabledModule then
		local SelectCartPricingOverrideModuleResult = SelectCartPricingOverrideModule(p1)
		
		if SelectCartPricingOverrideModuleResult ~= nil then
			Price = SelectCartPricingOverrideModuleResult.priceInRobux
			
			if SelectCartPricingOverrideModuleResult.basePriceInRobux ~= nil then
				BasePrice = SelectCartPricingOverrideModuleResult.basePriceInRobux
			end
		end
	end
	return {
		priceInRobux = Price,
		basePriceInRobux = BasePrice,
		discounts = PriceDiscountDetails,
		savingsSummaryOverride = if FFlagAXFixMISUpsellDiscountSummary then ProductInfo.savingsSummaryOverride else nil
	}
end