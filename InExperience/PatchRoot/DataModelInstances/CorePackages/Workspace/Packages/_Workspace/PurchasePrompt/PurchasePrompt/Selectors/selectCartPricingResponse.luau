local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience)

return function(p1) --[[ Line: 22 | Named "selectCartPricingResponse" ]]
	local CartPricing = p1.cartPricing
	
	return if CartPricing == nil then nil else CartPricing.response
end