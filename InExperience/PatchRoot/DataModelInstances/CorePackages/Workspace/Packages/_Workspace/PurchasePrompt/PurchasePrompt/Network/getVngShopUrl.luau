local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getVngShopUrl():andThen(function(p1)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p1)
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end