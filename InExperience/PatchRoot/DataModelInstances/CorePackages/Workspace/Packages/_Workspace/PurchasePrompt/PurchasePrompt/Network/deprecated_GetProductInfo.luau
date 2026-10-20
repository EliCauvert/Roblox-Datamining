local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1, p2, p3)
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getProductInfo(p2, p3):catch(function(_)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
	end)
end