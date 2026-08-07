local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = require(purchasePrompt.Parent.IAPExperience)
local fFlagFixResaleDisplayPriceModule = require(purchasePrompt.Flags.FFlagFixResaleDisplayPrice)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local selectCartPricingOverrideModule = require(script.Parent.selectCartPricingOverride)

return function(p0) --[[ line: 30 | named "selectPrice" ]]
	-- upvalues: fFlagFixResaleDisplayPriceModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectCartPricingOverrideModule (ref)
	local productInfo = p0.productInfo
	local price = productInfo.price or 0
	local basePrice = productInfo.basePrice or price
	local priceDiscountDetails = productInfo.priceDiscountDetails or {}
	
	if fFlagFixResaleDisplayPriceModule and p0.promptRequest then
		local collectibleItemInstanceId = p0.promptRequest.collectibleItemInstanceId
		
		if collectibleItemInstanceId and collectibleItemInstanceId ~= "" then
			local expectedPrice = p0.promptRequest.expectedPrice
			
			if expectedPrice ~= nil then
				price = expectedPrice
				basePrice = expectedPrice
			end
		end
	end
	if fFlagPurchasePromptCartPricingEnabledModule then
		local var7 = selectCartPricingOverrideModule(p0)
		
		if var7 ~= nil then
			price = var7.priceInRobux
			
			if var7.basePriceInRobux ~= nil then
				basePrice = var7.basePriceInRobux
			end
		end
	end
	return {
		priceInRobux = price,
		basePriceInRobux = basePrice,
		discounts = priceDiscountDetails
	}
end