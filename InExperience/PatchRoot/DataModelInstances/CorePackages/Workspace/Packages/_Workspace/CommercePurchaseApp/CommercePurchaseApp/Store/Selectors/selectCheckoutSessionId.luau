local _ = require(script:FindFirstAncestor("CommercePurchaseApp").Store.Types)

return function(p1) --[[ Line: 7 | Named "selectCheckoutSessionId" ]]
	return p1.commercePurchaseState.checkoutSessionId
end