local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local DeriveCartPricingViewFunction = require(PurchasePrompt.Parent.IAPExperience).deriveCartPricingView
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum

local function _(p1): boolean
	-- upvalues: ProductTypeEnum (copy)
	if type(p1) == "table" then
		local Kind = p1.kind
		
		return Kind == ProductTypeEnum.Asset or (Kind == ProductTypeEnum.Bundle or Kind == ProductTypeEnum.Look)
	else
		return false
	end
end

return function(p1)
	-- upvalues: ProductTypeEnum (copy), DeriveCartPricingViewFunction (copy)
	if p1 == nil then
		return nil
	end
	local ProductPayload = p1.productPayload
	local IsAssetMatch = nil
	
	if type(ProductPayload) == "table" then
		local Kind = ProductPayload.kind
		IsAssetMatch = Kind == ProductTypeEnum.Asset or (Kind == ProductTypeEnum.Bundle or Kind == ProductTypeEnum.Look)
	else
		IsAssetMatch = false
	end
	if not IsAssetMatch then
		return nil
	end
	local CartPricing = p1.cartPricing
	
	if CartPricing == nil then
		return nil
	else
		local DeriveCartPricingViewResult = DeriveCartPricingViewFunction(CartPricing.response)
		
		return if DeriveCartPricingViewResult == nil then nil else {
			priceInRobux = DeriveCartPricingViewResult.priceAfterDiscount,
			basePriceInRobux = DeriveCartPricingViewResult.originalPrice
		}
	end
end