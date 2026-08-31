local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local deriveCartPricingView = require(parent.IAPExperience).deriveCartPricingView
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local fFlagEnableInExperienceOffersPurchaseFlow = require(parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow

local function _(p1, p2)
	-- upvalues: productTypeEnum (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), requestTypeModule (ref)
	if type(p1) == "table" then
		local kind = p1.kind
		
		return kind == productTypeEnum.Asset or kind == productTypeEnum.Bundle or kind == productTypeEnum.Look or fFlagEnableInExperienceOffersPurchaseFlow and (p2 == requestTypeModule.GamePass or p2 == requestTypeModule.Product)
	end
end

return function(p1)
	-- upvalues: productTypeEnum (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), requestTypeModule (ref), deriveCartPricingView (ref)
	if p1 == nil then
		return nil
	end
	local var1
	local productPayload = p1.productPayload
	local requestType = p1.promptRequest and p1.promptRequest.requestType
	
	if type(productPayload) == "table" then
		local kind = productPayload.kind
		
		if kind == productTypeEnum.Asset or kind == productTypeEnum.Bundle or kind == productTypeEnum.Look then
			var1 = true
		elseif fFlagEnableInExperienceOffersPurchaseFlow and requestType ~= requestTypeModule.GamePass then
			var1 = requestType ~= requestTypeModule.Product
		end
		if not var1 then
			return nil
		end
		local cartPricing = p1.cartPricing
		
		if cartPricing == nil then
			return nil
		end
		productPayload = deriveCartPricingView(cartPricing.response)
		
		return if productPayload == nil then nil else {
			priceInRobux = productPayload.priceAfterDiscount,
			basePriceInRobux = productPayload.originalPrice
		}
	end
end