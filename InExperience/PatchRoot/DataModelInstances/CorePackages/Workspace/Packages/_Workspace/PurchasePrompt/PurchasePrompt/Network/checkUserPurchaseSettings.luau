local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1) --[[ Line: 7 | Named "checkUserPurchaseSettings" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.checkUserPurchaseSettings():andThen(function(Result) --[[ Line: 10 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end):catch(function(_) --[[ Line: 13 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end