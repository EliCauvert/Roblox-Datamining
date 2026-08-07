local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)

return function(p0) --[[ line: 5 | named "getPremiumProductInfo" ]]
	-- upvalues: promiseModule (ref), purchaseErrorModule (ref)
	return p0.getPremiumProductInfo():catch(function(_) --[[ line: 6 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailureNoItemName)
	end)
end