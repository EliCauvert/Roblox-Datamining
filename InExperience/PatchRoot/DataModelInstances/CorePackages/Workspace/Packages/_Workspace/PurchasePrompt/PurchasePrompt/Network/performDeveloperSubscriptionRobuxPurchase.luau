local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local promiseModule = require(purchasePrompt.Promise)
local parseSubscriptionErrorModule = require(purchasePrompt.Utils.parseSubscriptionError)

return function(p0, p1, p2) --[[ line: 9 | named "performDeveloperSubscriptionRobuxPurchase" ]]
	-- upvalues: promiseModule (ref), parseSubscriptionErrorModule (ref), purchaseErrorModule (ref)
	return p0.performDeveloperSubscriptionRobuxPurchase(p1, p2):andThen(function() --[[ line: 10 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve()
	end, function(p3) --[[ line: 12 ]]
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy), purchaseErrorModule (copy)
		return if type(p3) == "string" then promiseModule.reject(parseSubscriptionErrorModule(p3)) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end