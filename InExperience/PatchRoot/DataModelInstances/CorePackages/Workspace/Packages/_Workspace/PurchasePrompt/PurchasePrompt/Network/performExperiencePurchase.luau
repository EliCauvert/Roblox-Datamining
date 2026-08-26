local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = game:GetService("HttpService")
local parent = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local httpModule = require(parent.Http)
local argCheckModule = require(parent.ArgCheck)
local promiseModule = require(purchasePrompt.Promise)
local IAPExperienceModule = require(parent.IAPExperience)
local logging = require(parent.AppCommonLib).Logging
local _ = httpModule.Url
local _ = httpModule.PerformFetch
local isEconomicRestrictionResponse = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local _ = require(purchasePrompt.types)
local t = {
	new = function()
		return {
			purchased = false,
			productId = 0,
			reason = "",
			title = "",
			showDivId = "",
			shortfallPrice = 0,
			statusCode = 0
		}
	end
}
local _ = { InsufficientFunds = "InsufficientFunds" }

function t.fromJsonData(p1)
	-- upvalues: t (ref), argCheckModule (ref)
	local var1 = t.new()
	argCheckModule.isType(p1, "table", "PurchaseExperienceProduct.fromJsonData's jsonData")
	argCheckModule.isType(p1.purchased, "boolean", "PurchaseExperienceProduct.fromJsonData's jsonData.purchased")
	argCheckModule.isType(p1.productId, "number", "PurchaseExperienceProduct.fromJsonData's jsonData.productId")
	argCheckModule.isTypeOrNil(p1.reason, "string", "PurchaseExperienceProduct.fromJsonData's jsonData.reason")
	argCheckModule.isTypeOrNil(p1.title, "string", "PurchaseProduct.fromJsonData's jsonData.title")
	argCheckModule.isTypeOrNil(p1.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId")
	argCheckModule.isTypeOrNil(p1.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice")
	argCheckModule.isTypeOrNil(p1.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode")
	var1.purchased = p1.purchased == true
	var1.productId = tonumber(p1.productId)
	var1.reason = p1.reason
	var1.title = p1.title
	var1.showDivId = p1.showDivId
	var1.shortfallPrice = p1.shortfallPrice
	var1.statusCode = p1.statusCode
	
	return var1
end

return function(p1, p2, p3)
	-- upvalues: logging (ref), promiseModule (ref), purchaseErrorModule (ref), isEconomicRestrictionResponse (ref), t (ref)
	return p1.performExperiencePurchase(p2, p3):andThen(function(p4)
		-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy), t (copy)
		if type(p4) ~= "table" then
			logging.warn("Response from performExperiencePurchase is malformed!")
			
			return promiseModule.reject(purchaseErrorModule.UnknownFailure)
		elseif isEconomicRestrictionResponse(p4) then
			return promiseModule.reject(p4)
		end
		local var1 = t.fromJsonData(p4)
		
		return if var1.purchased then promiseModule.resolve(var1) elseif var1.reason and var1.reason == "InsufficientFunds" then promiseModule.reject(purchaseErrorModule.NotEnoughRobux) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end