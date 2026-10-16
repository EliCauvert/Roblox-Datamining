local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p1) --[[ Line: 8 | Named "selectItemData" ]]
	return p1.itemData or {}
end