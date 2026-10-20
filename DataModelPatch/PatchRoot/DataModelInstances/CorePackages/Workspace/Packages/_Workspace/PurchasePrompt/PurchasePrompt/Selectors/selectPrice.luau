local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(PurchasePrompt.Parent.IAPExperience)
local FFlagFixResaleDisplayPriceModule = require(PurchasePrompt.Flags.FFlagFixResaleDisplayPrice)
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local SelectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p1)
	-- upvalues: FFlagFixResaleDisplayPriceModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), SelectCartPricingOverrideModule (copy)
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
		discounts = PriceDiscountDetails
	}
end