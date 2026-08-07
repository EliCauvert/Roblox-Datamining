local _ = require(script:FindFirstAncestor("PurchasePrompt").Reducers.CartPricingReducer)

return function(p0) --[[ line: 15 | named "selectIsCartPricingFetching" ]]
	local cartPricing = p0.cartPricing
	
	return if cartPricing == nil then false else cartPricing.isFetching == true
end