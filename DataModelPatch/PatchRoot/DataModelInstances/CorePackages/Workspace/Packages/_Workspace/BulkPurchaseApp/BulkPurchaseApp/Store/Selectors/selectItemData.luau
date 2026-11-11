local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p1)
	return p1.itemData or {}
end