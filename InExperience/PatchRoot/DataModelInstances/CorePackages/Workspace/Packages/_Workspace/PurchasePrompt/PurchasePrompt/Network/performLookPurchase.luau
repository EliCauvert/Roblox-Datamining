local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = game:GetService("HttpService")
local parent = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local httpModule = require(parent.Http)
local _ = require(parent.ArgCheck)
local promiseModule = require(purchasePrompt.Promise)
local IAPExperienceModule = require(parent.IAPExperience)
local logging = require(parent.AppCommonLib).Logging
local _ = httpModule.Url
local _ = httpModule.PerformFetch
local isEconomicRestrictionResponse = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local _ = require(purchasePrompt.types)
local _ = {
	Unspecified = "Unspecified",
	Success = "Success",
	Failure = "Failure",
	PartialSuccess = "PartialSuccess"
}

return function(p1, p2, p3)
	-- upvalues: logging (ref), promiseModule (ref), purchaseErrorModule (ref), isEconomicRestrictionResponse (ref)
	return p1.performLookPurchase(p2, p3):andThen(function(p4)
		-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy)
		if type(p4) ~= "table" then
			logging.warn("Response from performLookPurchase is malformed!")
			
			return promiseModule.reject(purchaseErrorModule.UnknownFailure)
		end
		return if isEconomicRestrictionResponse(p4) then promiseModule.reject(p4) elseif p4.purchaseLookStatus == "Success" or p4.purchaseLookStatus == "PartialSuccess" then promiseModule.resolve(p4) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end