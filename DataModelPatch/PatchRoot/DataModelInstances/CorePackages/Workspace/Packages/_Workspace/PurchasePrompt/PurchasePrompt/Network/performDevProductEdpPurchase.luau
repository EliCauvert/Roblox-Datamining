local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local _ = game:GetService("HttpService")
local Parent = PurchasePrompt.Parent
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local HttpModule = require(Parent.Http)
local ArgCheckModule = require(Parent.ArgCheck)
local PromiseModule = require(PurchasePrompt.Promise)
local Logging = require(Parent.AppCommonLib).Logging
local _ = HttpModule.Url
local _ = HttpModule.PerformFetch
local IsEconomicRestrictionResponseFunction = require(Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local ParseDevProductPurchaseErrorModule = require(PurchasePrompt.Utils.parseDevProductPurchaseError)
local FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase = require(Parent.SharedFlags).FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase
local _ = require(PurchasePrompt.types)
local config = {
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

function config.fromJsonData(p1)
	-- upvalues: config (copy), ArgCheckModule (copy)
	local NewConfig = config.new()
	ArgCheckModule.isType(p1, "table", "PurchaseDeveloperProductModel.fromJsonData's jsonData")
	ArgCheckModule.isType(p1.price, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.price")
	ArgCheckModule.isType(p1.productId, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.productId")
	ArgCheckModule.isType(p1.purchased, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.purchased")
	ArgCheckModule.isTypeOrNil(p1.receipt, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.receipt")
	ArgCheckModule.isTypeOrNil(p1.success, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.success")
	ArgCheckModule.isTypeOrNil(p1.transactionStatus, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.transactionStatus")
	NewConfig.price = p1.price
	NewConfig.productId = p1.productId
	NewConfig.purchased = p1.purchased == true
	NewConfig.receipt = p1.receipt
	NewConfig.success = p1.success == true
	NewConfig.transactionStatus = p1.transactionStatus
	
	return NewConfig
end

return function(p1, p2, p3)
	-- upvalues: Logging (copy), PromiseModule (copy), PurchaseErrorModule (copy), IsEconomicRestrictionResponseFunction (copy), FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (copy), ParseDevProductPurchaseErrorModule (copy), config (copy)
	return p1.performDevProductEdpPurchase(p2, p3):andThen(function(Result)
		-- upvalues: Logging (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsEconomicRestrictionResponseFunction (upval), FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase (upval), ParseDevProductPurchaseErrorModule (upval), config (upval)
		if type(Result) ~= "table" then
			Logging.warn("Response from PurchaseDeveloperProduct is malformed!")
			
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end
		if IsEconomicRestrictionResponseFunction(Result) then
			return PromiseModule.reject(Result)
		end
		if FFlagEnableDevProductPendingProductsLimitExceededInUnifiedPurchase then
			local ParseDevProductPurchaseErrorModuleResult = ParseDevProductPurchaseErrorModule(Result)
			
			if ParseDevProductPurchaseErrorModuleResult == PurchaseErrorModule.PendingProductsLimitExceeded then
				return PromiseModule.reject(ParseDevProductPurchaseErrorModuleResult)
			end
		end
		local FromJsonDataResult = config.fromJsonData(Result)
		
		return if FromJsonDataResult.purchased then PromiseModule.resolve(FromJsonDataResult) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end, function(p4)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p4)
	end)
end