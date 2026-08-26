local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local promiseModule = require(purchasePrompt.Promise)
local isEconomicRestrictionResponse = require(parent.IAPExperience).Utility.isEconomicRestrictionResponse
local parseSubscriptionErrorModule = require(purchasePrompt.Utils.parseSubscriptionError)

return function(p1, p2)
	-- upvalues: isEconomicRestrictionResponse (ref), promiseModule (ref), parseSubscriptionErrorModule (ref), purchaseErrorModule (ref)
	return p1.performSubscriptionPurchase(p2, ""):andThen(function(p3)
		-- upvalues: isEconomicRestrictionResponse (copy), promiseModule (copy)
		return if isEconomicRestrictionResponse(p3) then promiseModule.reject(p3) else promiseModule.resolve(p3)
	end, function(p3)
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy), purchaseErrorModule (copy)
		return if type(p3) == "string" then promiseModule.reject(parseSubscriptionErrorModule(p3)) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end