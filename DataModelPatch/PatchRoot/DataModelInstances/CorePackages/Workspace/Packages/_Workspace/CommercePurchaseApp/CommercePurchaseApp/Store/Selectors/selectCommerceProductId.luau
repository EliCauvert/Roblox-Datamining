local _ = require(script:FindFirstAncestor("CommercePurchaseApp").Store.Types)

return function(p1)
	return p1.commercePurchaseState.commerceProductId
end