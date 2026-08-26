local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local fFlagAddPurchaseOptionForProvidingBalance = require(parent.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagAddPurchaseOptionForProvidingBalance (ref), promiseModule (ref), purchaseErrorModule (ref)
	return if fFlagAddPurchaseOptionForProvidingBalance and p5 ~= nil then promiseModule.resolve({ hasFailed = false, robux = p5 }) else p1.getBalanceInfo():andThen(function(p6)
		-- upvalues: p2 (ref), p3 (ref), promiseModule (copy)
		if p2.isStudio() and not p3 then
			p6.robux = 2147483647
		end
		p6.hasFailed = false
		
		return promiseModule.resolve(p6)
	end):catch(function(_)
		-- upvalues: p4 (ref), promiseModule (copy), purchaseErrorModule (copy)
		return if p4 then promiseModule.resolve({ robux = 0, hasFailed = true }) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end