local _ = require(script:FindFirstAncestor("CommercePurchaseApp").Store.Types)

return function(p0) --[[ line: 7 | named "selectCommerceProductId" ]]
	return p0.commercePurchaseState.commerceProductId
end