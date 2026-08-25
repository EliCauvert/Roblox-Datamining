local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0, p1, p2, p3)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getPurchaseWarning(p1, p2, p3):andThen(function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p4)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end