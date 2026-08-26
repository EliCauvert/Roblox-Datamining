local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience)

return function(p1)
	local cartPricing = p1.cartPricing
	
	return if cartPricing == nil then nil else cartPricing.response
end