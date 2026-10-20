local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local DeriveCartPricingViewFunction = require(Parent.IAPExperience).deriveCartPricingView
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local FFlagEnableInExperienceOffersPurchaseFlow = require(Parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow

local function _(p1, GamePass): boolean
	-- upvalues: ProductTypeEnum (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), RequestTypeModule (copy)
	if type(p1) == "table" then
		local Kind = p1.kind
		
		if Kind == ProductTypeEnum.Asset or Kind == ProductTypeEnum.Bundle or Kind == ProductTypeEnum.Look then
			return true
		end
	end
	return FFlagEnableInExperienceOffersPurchaseFlow and (GamePass == RequestTypeModule.GamePass or GamePass == RequestTypeModule.Product) or false
end

return function(p1)
	-- upvalues: ProductTypeEnum (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), RequestTypeModule (copy), DeriveCartPricingViewFunction (copy)
	if p1 == nil then
		return nil
	end
	local ProductPayload = p1.productPayload
	local RequestType = p1.promptRequest and p1.promptRequest.requestType
	local IsRequestTypeMatch = nil
	repeat
		if type(ProductPayload) == "table" then
			local Kind = ProductPayload.kind
			
			if Kind == ProductTypeEnum.Asset or Kind == ProductTypeEnum.Bundle or Kind == ProductTypeEnum.Look then
				IsRequestTypeMatch = true
				break
			end
		end
		IsRequestTypeMatch = FFlagEnableInExperienceOffersPurchaseFlow and (RequestType == RequestTypeModule.GamePass or RequestType == RequestTypeModule.Product) or false
	until true
	if not IsRequestTypeMatch then
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