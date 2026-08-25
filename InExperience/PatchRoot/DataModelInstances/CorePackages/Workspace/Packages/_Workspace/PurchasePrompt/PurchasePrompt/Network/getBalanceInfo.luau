local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local fFlagAddPurchaseOptionForProvidingBalance = require(parent.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance

return function(p0, p1, p2, p3, p4)
	-- upvalues: fFlagAddPurchaseOptionForProvidingBalance (ref), promiseModule (ref), purchaseErrorModule (ref)
	return if fFlagAddPurchaseOptionForProvidingBalance and p4 ~= nil then promiseModule.resolve({ hasFailed = false, robux = p4 }) else p0.getBalanceInfo():andThen(function(p5)
		-- upvalues: p1 (ref), p2 (ref), promiseModule (copy)
		if p1.isStudio() and not p2 then
			p5.robux = 2147483647
		end
		p5.hasFailed = false
		
		return promiseModule.resolve(p5)
	end):catch(function(_)
		-- upvalues: p3 (ref), promiseModule (copy), purchaseErrorModule (copy)
		return if p3 then promiseModule.resolve({ robux = 0, hasFailed = true }) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end