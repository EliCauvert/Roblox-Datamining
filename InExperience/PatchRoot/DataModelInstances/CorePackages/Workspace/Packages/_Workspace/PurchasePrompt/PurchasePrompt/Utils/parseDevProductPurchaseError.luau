local PurchaseErrorModule = require(script:FindFirstAncestor("PurchasePrompt").Enums.PurchaseError)

return function(p1) --[[ Line: 6 | Named "parseDevProductPurchaseError" ]]
	-- upvalues: PurchaseErrorModule (copy)
	return if PurchaseErrorModule.isMember(p1) then p1 elseif type(p1) == "table" and p1.errorCode == "PendingProductsLimitExceeded" then PurchaseErrorModule.PendingProductsLimitExceeded else p1
end