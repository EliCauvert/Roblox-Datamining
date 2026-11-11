local _ = require(script:FindFirstAncestor("PurchasePrompt").Reducers.CartPricingReducer)

return function(p1): boolean
	local CartPricing = p1.cartPricing
	
	return CartPricing ~= nil and CartPricing.isFetching == true
end