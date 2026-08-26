local purchaseErrorModule = require(script:FindFirstAncestor("PurchasePrompt").Enums.PurchaseError)

return function(p1)
	-- upvalues: purchaseErrorModule (ref)
	return if purchaseErrorModule.isMember(p1) then p1 elseif type(p1) == "table" and p1.errorCode == "PendingProductsLimitExceeded" then purchaseErrorModule.PendingProductsLimitExceeded else p1
end