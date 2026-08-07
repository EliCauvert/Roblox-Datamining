local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)

return function(p0) --[[ line: 6 | named "convertToDiscountInformationOrNil" ]]
	return if type(p0) == "table" then if next(p0) == nil then nil else p0 else nil
end