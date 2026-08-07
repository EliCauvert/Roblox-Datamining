local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(value) --[[ line: 7 | named "checkUserPurchaseSettings" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return value.checkUserPurchaseSettings():andThen(function(p0) --[[ line: 10 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p0)
	end):catch(function(_) --[[ line: 13 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end