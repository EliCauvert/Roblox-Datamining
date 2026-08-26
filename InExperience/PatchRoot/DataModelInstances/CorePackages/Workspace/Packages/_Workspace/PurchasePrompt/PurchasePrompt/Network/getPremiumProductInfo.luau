local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p1)
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p1.getPremiumProductInfo():catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end