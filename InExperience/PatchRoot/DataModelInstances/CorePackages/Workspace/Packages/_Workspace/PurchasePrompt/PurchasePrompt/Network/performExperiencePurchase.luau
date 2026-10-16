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
local _ = require(PurchasePrompt.types)
local config = {
	new = function() --[[ Line: 34 ]]
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

function config.fromJsonData(p1) --[[ Line: 46 ]]
	-- upvalues: config (copy), ArgCheckModule (copy)
	local NewConfig = config.new()
	ArgCheckModule.isType(p1, "table", "PurchaseExperienceProduct.fromJsonData's jsonData")
	ArgCheckModule.isType(p1.purchased, "boolean", "PurchaseExperienceProduct.fromJsonData's jsonData.purchased")
	ArgCheckModule.isType(p1.productId, "number", "PurchaseExperienceProduct.fromJsonData's jsonData.productId")
	ArgCheckModule.isTypeOrNil(p1.reason, "string", "PurchaseExperienceProduct.fromJsonData's jsonData.reason")
	ArgCheckModule.isTypeOrNil(p1.title, "string", "PurchaseProduct.fromJsonData's jsonData.title")
	ArgCheckModule.isTypeOrNil(p1.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId")
	ArgCheckModule.isTypeOrNil(p1.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice")
	ArgCheckModule.isTypeOrNil(p1.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode")
	NewConfig.purchased = p1.purchased == true
	NewConfig.productId = tonumber(p1.productId)
	NewConfig.reason = p1.reason
	NewConfig.title = p1.title
	NewConfig.showDivId = p1.showDivId
	NewConfig.shortfallPrice = p1.shortfallPrice
	NewConfig.statusCode = p1.statusCode
	
	return NewConfig
end

return function(p1, p2, p3) --[[ Line: 69 | Named "performExperiencePurchase" ]]
	-- upvalues: Logging (copy), PromiseModule (copy), PurchaseErrorModule (copy), IsEconomicRestrictionResponseFunction (copy), config (copy)
	return p1.performExperiencePurchase(p2, p3):andThen(function(Result) --[[ Line: 70 ]]
		-- upvalues: Logging (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsEconomicRestrictionResponseFunction (upval), config (upval)
		if type(Result) ~= "table" then
			Logging.warn("Response from performExperiencePurchase is malformed!")
			
			return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		elseif IsEconomicRestrictionResponseFunction(Result) then
			return PromiseModule.reject(Result)
		else
			local FromJsonDataResult = config.fromJsonData(Result)
			
			return if FromJsonDataResult.purchased then PromiseModule.resolve(FromJsonDataResult) elseif FromJsonDataResult.reason and FromJsonDataResult.reason == "InsufficientFunds" then PromiseModule.reject(PurchaseErrorModule.NotEnoughRobux) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
		end
	end, function(p4) --[[ Line: 93 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p4)
	end)
end