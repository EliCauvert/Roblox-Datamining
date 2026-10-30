local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)
local _ = require(PurchasePrompt.types)
local IsEconomicRestrictionResponseFunction = require(PurchasePrompt.Parent.IAPExperience).Utility.isEconomicRestrictionResponse

return function(p1, p2, p3)
	-- upvalues: IsEconomicRestrictionResponseFunction (copy), PromiseModule (copy), PurchaseErrorModule (copy)
	return p1.performVIPServerPurchase(p2, p3):andThen(function(Result)
		-- upvalues: IsEconomicRestrictionResponseFunction (upval), PromiseModule (upval), PurchaseErrorModule (upval)
		return if IsEconomicRestrictionResponseFunction(Result) then PromiseModule.reject(Result) elseif type(Result) == "table" and type(Result.vipServerId) == "number" then Result else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end