local _ = require(script:FindFirstAncestor("PurchasePrompt").Reducers.CartPricingReducer)

return function(p1): boolean --[[ Line: 15 | Named "selectIsCartPricingFetching" ]]
	local CartPricing = p1.cartPricing
	
	return CartPricing ~= nil and CartPricing.isFetching == true
end