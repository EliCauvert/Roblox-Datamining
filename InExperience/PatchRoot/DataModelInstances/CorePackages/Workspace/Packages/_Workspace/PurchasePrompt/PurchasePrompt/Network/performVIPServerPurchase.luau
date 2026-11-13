local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)
local _ = require(PurchasePrompt.types)
local ParseVIPServerPurchaseErrorModule = require(PurchasePrompt.Utils.parseVIPServerPurchaseError)
local IsEconomicRestrictionResponseFunction = require(PurchasePrompt.Parent.IAPExperience).Utility.isEconomicRestrictionResponse

return function(p1, p2, p3)
	-- upvalues: IsEconomicRestrictionResponseFunction (copy), PromiseModule (copy), ParseVIPServerPurchaseErrorModule (copy), PurchaseErrorModule (copy)
	return p1.performVIPServerPurchase(p2, p3):andThen(function(Result)
		-- upvalues: IsEconomicRestrictionResponseFunction (upval), PromiseModule (upval), ParseVIPServerPurchaseErrorModule (upval), PurchaseErrorModule (upval)
		if IsEconomicRestrictionResponseFunction(Result) then
			return PromiseModule.reject(Result)
		else
			local ParseVIPServerPurchaseErrorModuleResult = ParseVIPServerPurchaseErrorModule(Result)
			
			return if PurchaseErrorModule.isMember(ParseVIPServerPurchaseErrorModuleResult) then PromiseModule.reject(ParseVIPServerPurchaseErrorModuleResult) elseif type(Result) == "table" and type(Result.vipServerId) == "number" then Result else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end
	end)
end