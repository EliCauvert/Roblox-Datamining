local _ = require(script:FindFirstAncestor("PurchasePrompt").Reducers.CartPricingReducer)

return function(p1)
	local cartPricing = p1.cartPricing
	
	return if cartPricing == nil then false else cartPricing.isFetching == true
end