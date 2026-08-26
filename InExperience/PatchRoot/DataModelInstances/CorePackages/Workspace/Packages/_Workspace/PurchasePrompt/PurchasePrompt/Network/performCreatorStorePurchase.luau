local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local _ = require(parent.Misc.Constants)
local promiseModule = require(parent.Promise)

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p1.performCreatorStorePurchase(p2, p3):andThen(function(p4)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return if p4.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_ALREADY_OWNED" or p4.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_SUCCESS" then promiseModule.resolve(p4) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end