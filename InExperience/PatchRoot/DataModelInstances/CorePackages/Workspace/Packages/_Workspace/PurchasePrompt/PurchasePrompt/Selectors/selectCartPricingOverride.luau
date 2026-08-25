local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local deriveCartPricingView = require(purchasePrompt.Parent.IAPExperience).deriveCartPricingView
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum

local function _(p0)
	-- upvalues: productTypeEnum (ref)
	if type(p0) ~= "table" then
		return false
	end
	local kind = p0.kind
	
	return if kind ~= productTypeEnum.Asset then if kind ~= productTypeEnum.Bundle then kind == productTypeEnum.Look else true else true
end

return function(p1)
	-- upvalues: productTypeEnum (ref), deriveCartPricingView (ref)
	if p1 == nil then
		return nil
	end
	local var1
	local productPayload = p1.productPayload
	
	if type(productPayload) == "table" then
		local kind = productPayload.kind
		var1 = if kind ~= productTypeEnum.Asset then if kind ~= productTypeEnum.Bundle then kind == productTypeEnum.Look else true else true
	else
		var1 = false
	end
	if not var1 then
		return nil
	end
	local cartPricing = p1.cartPricing
	
	if cartPricing == nil then
		return nil
	end
	local var2 = deriveCartPricingView(cartPricing.response)
	
	return if var2 == nil then nil else {
		priceInRobux = var2.priceAfterDiscount,
		basePriceInRobux = var2.originalPrice
	}
end