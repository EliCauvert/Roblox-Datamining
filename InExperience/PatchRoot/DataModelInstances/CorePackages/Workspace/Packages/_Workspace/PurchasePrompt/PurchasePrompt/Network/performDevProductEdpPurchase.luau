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
local parseDevProductPurchaseErrorModule = require(purchasePrompt.Utils.parseDevProductPurchaseError)
local fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase = require(parent.SharedFlags).FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase
local _ = require(purchasePrompt.types)
local t = {
	new = function()
		return {
			price = 0,
			productId = 0,
			purchased = false,
			receipt = "",
			success = false,
			transactionStatus = ""
		}
	end
}

function t.fromJsonData(p1)
	-- upvalues: t (ref), argCheckModule (ref)
	local var1 = t.new()
	argCheckModule.isType(p1, "table", "PurchaseDeveloperProductModel.fromJsonData's jsonData")
	argCheckModule.isType(p1.price, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.price")
	argCheckModule.isType(p1.productId, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.productId")
	argCheckModule.isType(p1.purchased, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.purchased")
	argCheckModule.isTypeOrNil(p1.receipt, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.receipt")
	argCheckModule.isTypeOrNil(p1.success, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.success")
	argCheckModule.isTypeOrNil(p1.transactionStatus, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.transactionStatus")
	var1.price = p1.price
	var1.productId = p1.productId
	var1.purchased = p1.purchased == true
	var1.receipt = p1.receipt
	var1.success = p1.success == true
	var1.transactionStatus = p1.transactionStatus
	
	return var1
end

return function(p1, p2, p3)
	-- upvalues: logging (ref), promiseModule (ref), purchaseErrorModule (ref), isEconomicRestrictionResponse (ref), fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (ref), parseDevProductPurchaseErrorModule (ref), t (ref)
	return p1.performDevProductEdpPurchase(p2, p3):andThen(function(p4)
		-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy), fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (copy), parseDevProductPurchaseErrorModule (copy), t (copy)
		if type(p4) ~= "table" then
			logging.warn("Response from PurchaseDeveloperProduct is malformed!")
			
			return promiseModule.reject(purchaseErrorModule.UnknownFailure)
		elseif isEconomicRestrictionResponse(p4) then
			return promiseModule.reject(p4)
		elseif fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then
			local var1 = parseDevProductPurchaseErrorModule(p4)
			
			if var1 == purchaseErrorModule.PendingProductsLimitExceeded then
				return promiseModule.reject(var1)
			end
		end
		local var2 = t.fromJsonData(p4)
		
		return if var2.purchased then promiseModule.resolve(var2) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end