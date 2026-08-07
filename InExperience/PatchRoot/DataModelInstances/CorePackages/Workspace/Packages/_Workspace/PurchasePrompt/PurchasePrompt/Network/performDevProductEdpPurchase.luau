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
	new = function() --[[ line: 32 ]]
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

function t.fromJsonData(p0) --[[ line: 43 ]]
	-- upvalues: t (ref), argCheckModule (ref)
	local var8 = t.new()
	argCheckModule.isType(p0, "table", "PurchaseDeveloperProductModel.fromJsonData's jsonData")
	argCheckModule.isType(p0.price, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.price")
	argCheckModule.isType(p0.productId, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.productId")
	argCheckModule.isType(p0.purchased, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.purchased")
	argCheckModule.isTypeOrNil(p0.receipt, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.receipt")
	argCheckModule.isTypeOrNil(p0.success, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.success")
	argCheckModule.isTypeOrNil(p0.transactionStatus, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.transactionStatus")
	var8.price = p0.price
	var8.productId = p0.productId
	var8.purchased = p0.purchased == true
	var8.receipt = p0.receipt
	var8.success = p0.success == true
	var8.transactionStatus = p0.transactionStatus
	
	return var8
end

return function(p1, p2, p3) --[[ line: 68 | named "performDevProductEdpPurchase" ]]
	-- upvalues: logging (ref), promiseModule (ref), purchaseErrorModule (ref), isEconomicRestrictionResponse (ref), fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (ref), parseDevProductPurchaseErrorModule (ref), t (ref)
	return p1.performDevProductEdpPurchase(p2, p3):andThen(function(p4) --[[ line: 69 ]]
		-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy), fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (copy), parseDevProductPurchaseErrorModule (copy), t (copy)
		if type(p4) ~= "table" then
			logging.warn("Response from PurchaseDeveloperProduct is malformed!")
			
			return promiseModule.reject(purchaseErrorModule.UnknownFailure)
		elseif isEconomicRestrictionResponse(p4) then
			return promiseModule.reject(p4)
		elseif fFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then
			local var9 = parseDevProductPurchaseErrorModule(p4)
			
			if var9 == purchaseErrorModule.PendingProductsLimitExceeded then
				return promiseModule.reject(var9)
			end
		end
		local var10 = t.fromJsonData(p4)
		
		return if var10.purchased then promiseModule.resolve(var10) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p5) --[[ line: 94 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p5)
	end)
end