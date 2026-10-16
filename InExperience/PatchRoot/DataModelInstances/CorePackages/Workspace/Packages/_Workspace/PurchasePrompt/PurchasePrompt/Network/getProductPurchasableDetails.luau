local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1, p2) --[[ Line: 6 | Named "getProductPurchasableDetails" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getProductPurchasableDetails(p2):andThen(function(Result) --[[ Line: 9 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end):catch(function(_) --[[ Line: 12 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end