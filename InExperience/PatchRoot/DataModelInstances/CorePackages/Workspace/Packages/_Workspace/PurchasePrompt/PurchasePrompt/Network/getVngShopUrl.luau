local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0) --[[ line: 5 | named "getVngShopUrl" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getVngShopUrl():andThen(function(p1) --[[ line: 8 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p1)
	end):catch(function(_) --[[ line: 11 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end