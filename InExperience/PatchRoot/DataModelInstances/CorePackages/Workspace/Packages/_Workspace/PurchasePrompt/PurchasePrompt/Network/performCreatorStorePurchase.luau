local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local _ = require(parent.Misc.Constants)
local promiseModule = require(parent.Promise)

return function(p0, p1, p2) --[[ line: 7 | named "performCreatorStorePurchase" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.performCreatorStorePurchase(p1, p2):andThen(function(p3) --[[ line: 8 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return if p3.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_ALREADY_OWNED" or p3.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_SUCCESS" then promiseModule.resolve(p3) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(_) --[[ line: 17 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end