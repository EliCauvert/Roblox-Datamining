local purchaseErrorModule = require(script:FindFirstAncestor("PurchasePrompt").Enums.PurchaseError)

return function(p0) --[[ line: 6 | named "parseDevProductPurchaseError" ]]
	-- upvalues: purchaseErrorModule (ref)
	return if purchaseErrorModule.isMember(p0) then p0 elseif type(p0) == "table" and p0.errorCode == "PendingProductsLimitExceeded" then purchaseErrorModule.PendingProductsLimitExceeded else p0
end