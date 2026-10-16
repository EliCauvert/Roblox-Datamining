local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = PurchasePrompt.Parent
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)
local ParseSubscriptionErrorModule = require(PurchasePrompt.Utils.parseSubscriptionError)

return function(p1, p2, p3) --[[ Line: 9 | Named "performDeveloperSubscriptionRobuxPurchase" ]]
	-- upvalues: PromiseModule (copy), ParseSubscriptionErrorModule (copy), PurchaseErrorModule (copy)
	return p1.performDeveloperSubscriptionRobuxPurchase(p2, p3):andThen(function() --[[ Line: 10 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve()
	end, function(p4) --[[ Line: 12 ]]
		-- upvalues: PromiseModule (upval), ParseSubscriptionErrorModule (upval), PurchaseErrorModule (upval)
		return if type(p4) == "string" then PromiseModule.reject(ParseSubscriptionErrorModule(p4)) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end