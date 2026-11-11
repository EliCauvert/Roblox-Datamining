local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = game:GetService("HttpService")
local Parent = PurchasePrompt.Parent
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local HttpModule = require(Parent.Http)
local _ = require(Parent.ArgCheck)
local PromiseModule = require(PurchasePrompt.Promise)
local Logging = require(Parent.AppCommonLib).Logging
local _ = HttpModule.Url
local _ = HttpModule.PerformFetch
local IsEconomicRestrictionResponseFunction = require(Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local _ = require(PurchasePrompt.types)

return function(p1, p2, p3)
	-- upvalues: Logging (copy), PromiseModule (copy), PurchaseErrorModule (copy), IsEconomicRestrictionResponseFunction (copy)
	return p1.performLookPurchase(p2, p3):andThen(function(Result)
		-- upvalues: Logging (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsEconomicRestrictionResponseFunction (upval)
		if type(Result) == "table" then
			return if IsEconomicRestrictionResponseFunction(Result) then PromiseModule.reject(Result) elseif Result.purchaseLookStatus == "Success" or Result.purchaseLookStatus == "PartialSuccess" then PromiseModule.resolve(Result) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		else
			Logging.warn("Response from performLookPurchase is malformed!")
			
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end
	end, function(p4)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p4)
	end)
end