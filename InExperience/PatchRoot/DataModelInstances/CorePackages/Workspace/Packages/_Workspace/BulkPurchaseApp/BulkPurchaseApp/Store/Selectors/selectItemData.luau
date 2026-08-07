local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p0) --[[ line: 8 | named "selectItemData" ]]
	return p0.itemData or {}
end