local _ = require(script:FindFirstAncestor("CommercePurchaseApp").Store.Types)

return function(p0)
	return p0.commercePurchaseState.checkoutSessionId
end