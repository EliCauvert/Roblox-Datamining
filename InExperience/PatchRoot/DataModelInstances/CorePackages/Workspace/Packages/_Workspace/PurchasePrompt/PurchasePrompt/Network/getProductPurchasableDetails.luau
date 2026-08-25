local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0, p1)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getProductPurchasableDetails(p1):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end