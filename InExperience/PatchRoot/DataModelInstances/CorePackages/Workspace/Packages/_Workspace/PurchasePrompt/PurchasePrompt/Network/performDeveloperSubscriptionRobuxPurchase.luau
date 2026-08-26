local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local promiseModule = require(purchasePrompt.Promise)
local parseSubscriptionErrorModule = require(purchasePrompt.Utils.parseSubscriptionError)

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), parseSubscriptionErrorModule (ref), purchaseErrorModule (ref)
	return p1.performDeveloperSubscriptionRobuxPurchase(p2, p3):andThen(function()
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve()
	end, function(p4)
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy), purchaseErrorModule (copy)
		return if type(p4) == "string" then promiseModule.reject(parseSubscriptionErrorModule(p4)) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end