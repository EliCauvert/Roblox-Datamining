local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)
local IsEconomicRestrictionResponseFunction = require(PurchasePrompt.Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local ParseSubscriptionErrorModule = require(PurchasePrompt.Utils.parseSubscriptionError)

return function(p1, p2) --[[ Line: 11 | Named "performDeveloperSubscriptionFiatPurchase" ]]
	-- upvalues: IsEconomicRestrictionResponseFunction (copy), PromiseModule (copy), ParseSubscriptionErrorModule (copy), PurchaseErrorModule (copy)
	return p1.performSubscriptionPurchase(p2, ""):andThen(function(Result) --[[ Line: 12 ]]
		-- upvalues: IsEconomicRestrictionResponseFunction (upval), PromiseModule (upval)
		return if IsEconomicRestrictionResponseFunction(Result) then PromiseModule.reject(Result) else PromiseModule.resolve(Result)
	end, function(p3) --[[ Line: 18 ]]
		-- upvalues: PromiseModule (upval), ParseSubscriptionErrorModule (upval), PurchaseErrorModule (upval)
		return if type(p3) == "string" then PromiseModule.reject(ParseSubscriptionErrorModule(p3)) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end