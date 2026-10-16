local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1, p2, p3) --[[ Line: 6 | Named "deprecated_GetProductInfo" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getProductInfo(p2, p3):catch(function(_) --[[ Line: 7 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
	end)
end