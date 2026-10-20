local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local _ = require(Parent.Misc.Constants)
local PromiseModule = require(Parent.Promise)

return function(p1, p2, p3)
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.performCreatorStorePurchase(p2, p3):andThen(function(Result)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return if Result.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_ALREADY_OWNED" or Result.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_SUCCESS" then PromiseModule.resolve(Result) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end, function(_)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end