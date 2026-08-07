local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0, _) --[[ line: 6 | named "getAccountInfo" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getAccountInfo():andThen(function(p1) --[[ line: 9 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p1)
	end):catch(function(_) --[[ line: 12 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end