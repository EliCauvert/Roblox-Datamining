local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)
local FFlagAddPurchaseOptionForProvidingBalance = require(Parent.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance

return function(p1, p2, p3, p4, Robux) --[[ Line: 10 | Named "getBalanceInfo" ]]
	-- upvalues: FFlagAddPurchaseOptionForProvidingBalance (copy), PromiseModule (copy), PurchaseErrorModule (copy)
	return if FFlagAddPurchaseOptionForProvidingBalance and Robux ~= nil then PromiseModule.resolve({ hasFailed = false, robux = Robux }) else p1.getBalanceInfo():andThen(function(Result) --[[ Line: 22 ]]
		-- upvalues: p2 (copy), p3 (copy), PromiseModule (upval)
		if p2.isStudio() and not p3 then
			Result.robux = 2147483647
		end
		Result.hasFailed = false
		
		return PromiseModule.resolve(Result)
	end):catch(function(_) --[[ Line: 33 ]]
		-- upvalues: p4 (copy), PromiseModule (upval), PurchaseErrorModule (upval)
		return if p4 then PromiseModule.resolve({ robux = 0, hasFailed = true }) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end