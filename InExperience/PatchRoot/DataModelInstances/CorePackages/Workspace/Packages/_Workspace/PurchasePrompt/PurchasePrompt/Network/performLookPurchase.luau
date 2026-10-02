local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local httpModule = require(parent.Http)
local promiseModule = require(purchasePrompt.Promise)
local _ = require(purchasePrompt.Enums.ItemType)
local IAPExperienceModule = require(parent.IAPExperience)
local logging = require(parent.AppCommonLib).Logging
local _ = httpModule.PerformFetch
local isEconomicRestrictionResponse = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local _ = require(purchasePrompt.types)
local _ = require(parent.AvatarExperienceCommon.PurchaseItemsTypes)
local constantsModule = require(purchasePrompt.Misc.Constants)
local _ = {
	Unspecified = "Unspecified",
	Success = "Success",
	Failure = "Failure",
	PartialSuccess = "PartialSuccess"
}

if require(purchasePrompt.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks then
	local function toLegacyLookPurchaseResult(p1, p2)
		-- upvalues: constantsModule (ref)
		local t = {}
		local t_1 = {}
		local var1 = 0
		local var2 = 0
		
		for i, v in ipairs(p1.fulfillmentGroups or {}) do
			for i_1, v_1 in ipairs(v.lineItems or {}) do
				local collectibleProductId = p2[v_1.collectibleProductId]
				
				if collectibleProductId ~= nil then
					local var3 = if v_1.status == "SUCCEEDED" then "Success" else "Failure"
					var2 += 1
					
					if var3 == "Success" then
						var1 += 1
					end
					if collectibleProductId.itemType == constantsModule.ProductType.Asset then
						t[collectibleProductId.itemId] = var3
					else
						t_1[collectibleProductId.itemId] = var3
					end
				end
			end
		end
		return {
			purchaseLookStatus = if var2 > 0 and var1 == var2 then "Success" elseif var1 > 0 then "PartialSuccess" else "Failure",
			assetPurchaseStatus = t,
			bundlePurchaseStatus = t_1
		}
	end
	
	return function(p3, p4, p5)
		-- upvalues: promiseModule (ref), purchaseErrorModule (ref), logging (ref), isEconomicRestrictionResponse (ref), toLegacyLookPurchaseResult (ref)
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p5.bulkPurchaseLineItems or {}) do
			t[v.collectibleProductId] = v
			table.insert(t_1, {
				collectibleProductId = v.collectibleProductId,
				collectibleItemId = v.collectibleItemId,
				agreedPriceRobux = v.agreedPriceRobux,
				rentalOption = if v.rentalDays and v.rentalDays > 0 then { durationDays = v.rentalDays } else nil,
				offerIds = v.offerIds
			})
		end
		return if #t_1 == 0 then promiseModule.reject(purchaseErrorModule.UnknownFailure) else p3.performLookPurchaseBulkPurchase(p4, p5.idempotencyKey, t_1):andThen(function(p6)
			-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy), toLegacyLookPurchaseResult (copy), t (ref)
			if type(p6) ~= "table" then
				logging.warn("Response from performLookPurchase is malformed!")
				
				return promiseModule.reject(purchaseErrorModule.UnknownFailure)
			elseif isEconomicRestrictionResponse(p6) then
				return promiseModule.reject(p6)
			end
			local var4 = toLegacyLookPurchaseResult(p6, t)
			
			return if var4.purchaseLookStatus == "Success" or var4.purchaseLookStatus == "PartialSuccess" then promiseModule.resolve(var4) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
		end, function(p6)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject(p6)
		end)
	end
end
return function(p3, p4, p5)
	-- upvalues: logging (ref), promiseModule (ref), purchaseErrorModule (ref), isEconomicRestrictionResponse (ref)
	return p3.performLookPurchase(p4, p5):andThen(function(p6)
		-- upvalues: logging (copy), promiseModule (copy), purchaseErrorModule (copy), isEconomicRestrictionResponse (copy)
		if type(p6) ~= "table" then
			logging.warn("Response from performLookPurchase is malformed!")
			
			return promiseModule.reject(purchaseErrorModule.UnknownFailure)
		end
		return if isEconomicRestrictionResponse(p6) then promiseModule.reject(p6) elseif p6.purchaseLookStatus == "Success" or p6.purchaseLookStatus == "PartialSuccess" then promiseModule.resolve(p6) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(p6)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p6)
	end)
end