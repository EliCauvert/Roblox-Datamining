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

return function(p0, p1, p2)
	-- upvalues: logging (ref), promiseModule (ref), purchaseErrorModule (ref), isEconomicRestrictionResponse (ref)
	return p0.performLookPurchase(p1, p2):andThen(function(p3)
		-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy)
		if type(p3) ~= "table" then
			logging.warn("Response from performLookPurchase is malformed!")
			
			return promiseModule.reject(purchaseErrorModule.UnknownFailure)
		end
		return if isEconomicRestrictionResponse(p3) then promiseModule.reject(p3) elseif p3.purchaseLookStatus == "Success" or p3.purchaseLookStatus == "PartialSuccess" then promiseModule.resolve(p3) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end