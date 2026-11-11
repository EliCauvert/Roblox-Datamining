local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p1)
	return if type(p1) == "table" then if next(p1) == nil then nil else p1 else nil
end