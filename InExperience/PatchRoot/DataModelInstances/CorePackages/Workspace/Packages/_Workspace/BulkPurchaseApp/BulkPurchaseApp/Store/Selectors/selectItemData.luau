local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p0)
	return p0.itemData or {}
end