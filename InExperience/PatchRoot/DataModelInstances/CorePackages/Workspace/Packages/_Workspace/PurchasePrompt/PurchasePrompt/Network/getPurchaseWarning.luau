local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)

return function(p1, p2, p3, p4) --[[ Line: 5 | Named "getPurchaseWarning" ]]
	-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.getPurchaseWarning(p2, p3, p4):andThen(function(Result) --[[ Line: 8 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result)
	end):catch(function(_) --[[ Line: 11 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end