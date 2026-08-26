local _ = require(script:FindFirstAncestor("CancelSubscriptionApp").Store.Types)

return function(p1)
	return p1.expirationDate
end