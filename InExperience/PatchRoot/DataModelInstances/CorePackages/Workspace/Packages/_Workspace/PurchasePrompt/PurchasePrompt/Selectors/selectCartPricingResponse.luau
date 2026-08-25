local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.IAPExperience)

return function(p0)
	local cartPricing = p0.cartPricing
	
	return if cartPricing == nil then nil else cartPricing.response
end