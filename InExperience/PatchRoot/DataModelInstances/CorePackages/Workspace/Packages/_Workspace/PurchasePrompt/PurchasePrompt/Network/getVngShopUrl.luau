local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1) --[[ Line: 5 | Named "getVngShopUrl" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getVngShopUrl():andThen(function(Result) --[[ Line: 8 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end):catch(function(_) --[[ Line: 11 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end