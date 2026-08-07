local _ = require(script:FindFirstAncestor("CommercePurchaseApp").Store.Types)

return function(p0) --[[ line: 7 | named "selectCheckoutSessionId" ]]
	return p0.commercePurchaseState.checkoutSessionId
end