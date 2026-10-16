local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1) --[[ Line: 5 | Named "getPremiumProductInfo" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getPremiumProductInfo():catch(function(_) --[[ Line: 6 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailureNoItemName)
	end)
end