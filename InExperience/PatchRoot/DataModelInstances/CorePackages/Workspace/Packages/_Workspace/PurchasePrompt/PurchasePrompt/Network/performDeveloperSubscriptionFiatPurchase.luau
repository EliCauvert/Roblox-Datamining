local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local promiseModule = require(purchasePrompt.Promise)
local isEconomicRestrictionResponse = require(parent.IAPExperience).Utility.isEconomicRestrictionResponse
local parseSubscriptionErrorModule = require(purchasePrompt.Utils.parseSubscriptionError)

return function(p0, p1)
	-- upvalues: isEconomicRestrictionResponse (ref), promiseModule (ref), parseSubscriptionErrorModule (ref), purchaseErrorModule (ref)
	return p0.performSubscriptionPurchase(p1, ""):andThen(function(p2)
		-- upvalues: isEconomicRestrictionResponse (copy), promiseModule (copy)
		return if isEconomicRestrictionResponse(p2) then promiseModule.reject(p2) else promiseModule.resolve(p2)
	end, function(p3)
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy), purchaseErrorModule (copy)
		return if type(p3) == "string" then promiseModule.reject(parseSubscriptionErrorModule(p3)) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end