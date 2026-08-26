local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p1.getProductInfo(p2, p3):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end