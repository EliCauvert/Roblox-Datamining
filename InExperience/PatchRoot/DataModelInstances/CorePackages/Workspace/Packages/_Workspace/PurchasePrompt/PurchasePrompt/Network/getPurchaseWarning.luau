local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0, p1, p2, p3) --[[ line: 5 | named "getPurchaseWarning" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getPurchaseWarning(p1, p2, p3):andThen(function(p4) --[[ line: 8 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p4)
	end):catch(function(_) --[[ line: 11 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end