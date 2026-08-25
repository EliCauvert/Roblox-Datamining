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

function t.fromJsonData(p0)
	-- upvalues: t (ref), argCheckModule (ref)
	local var7 = t.new()
	argCheckModule.isType(p0, "table", "PurchaseExperienceProduct.fromJsonData's jsonData")
	argCheckModule.isType(p0.purchased, "boolean", "PurchaseExperienceProduct.fromJsonData's jsonData.purchased")
	argCheckModule.isType(p0.productId, "number", "PurchaseExperienceProduct.fromJsonData's jsonData.productId")
	argCheckModule.isTypeOrNil(p0.reason, "string", "PurchaseExperienceProduct.fromJsonData's jsonData.reason")
	argCheckModule.isTypeOrNil(p0.title, "string", "PurchaseProduct.fromJsonData's jsonData.title")
	argCheckModule.isTypeOrNil(p0.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId")
	argCheckModule.isTypeOrNil(p0.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice")
	argCheckModule.isTypeOrNil(p0.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode")
	var7.purchased = p0.purchased == true
	var7.productId = tonumber(p0.productId)
	var7.reason = p0.reason
	var7.title = p0.title
	var7.showDivId = p0.showDivId
	var7.shortfallPrice = p0.shortfallPrice
	var7.statusCode = p0.statusCode
	
	return var7
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
		local var8 = t.fromJsonData(p4)
		
		return if var8.purchased then promiseModule.resolve(var8) elseif var8.reason and var8.reason == "InsufficientFunds" then promiseModule.reject(purchaseErrorModule.NotEnoughRobux) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p5)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p5)
	end)
end