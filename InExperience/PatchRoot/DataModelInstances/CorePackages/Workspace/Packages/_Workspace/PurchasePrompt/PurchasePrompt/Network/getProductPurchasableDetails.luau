local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0, p1) --[[ line: 6 | named "getProductPurchasableDetails" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getProductPurchasableDetails(p1):andThen(function(p2) --[[ line: 9 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2)
	end):catch(function(_) --[[ line: 12 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end