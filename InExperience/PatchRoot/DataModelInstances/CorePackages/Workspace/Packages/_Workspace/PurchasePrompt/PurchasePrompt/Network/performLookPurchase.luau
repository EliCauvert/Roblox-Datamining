local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromiseModule = require(PurchasePrompt.Promise)
local _ = require(PurchasePrompt.Enums.ItemType)
local Logging = require(Parent.AppCommonLib).Logging
local _ = require(Parent.Http).PerformFetch
local IsEconomicRestrictionResponseFunction = require(Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local _ = require(PurchasePrompt.types)
local _ = require(Parent.AvatarExperienceCommon.PurchaseItemsTypes)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)

if require(PurchasePrompt.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricingForLooks then
	local function toLegacyLookPurchaseResult(p1, p2) --[[ Line: 33 ]]
		-- upvalues: ConstantsModule (copy)
		local AssetPurchaseStatus = {}
		local BundlePurchaseStatus = {}
		local Count = 0
		local Count1 = 0
		local Iterator = ipairs
		local FulfillmentGroups = p1.fulfillmentGroups or {}
		for _, value in Iterator(FulfillmentGroups) do
			local Iterator1 = ipairs
			local LineItems = value.lineItems or {}
			for _, value1 in Iterator1(LineItems) do
				local v1 = p2[value1.collectibleProductId]
				
				if v1 ~= nil then
					local Success: string = if value1.status == "SUCCEEDED" then "Success" else "Failure"
					Count1 += 1
					
					if Success == "Success" then
						Count += 1
					end
					if v1.itemType == ConstantsModule.ProductType.Asset then
						AssetPurchaseStatus[v1.itemId] = Success
					else
						BundlePurchaseStatus[v1.itemId] = Success
					end
				end
			end
		end
		return {
			purchaseLookStatus = if Count1 > 0 and Count == Count1 then "Success" elseif Count > 0 then "PartialSuccess" else "Failure",
			assetPurchaseStatus = AssetPurchaseStatus,
			bundlePurchaseStatus = BundlePurchaseStatus
		}
	end
	
	return function(p3, p4, p5) --[[ Line: 78 | Named "performLookPurchase" ]]
		-- upvalues: PromiseModule (copy), PurchaseErrorModule (copy), Logging (copy), IsEconomicRestrictionResponseFunction (copy), toLegacyLookPurchaseResult (copy)
		local t = {}
		local List = {}
		local Iterator = ipairs
		local BulkPurchaseLineItems = p5.bulkPurchaseLineItems or {}
		for _, value in Iterator(BulkPurchaseLineItems) do
			t[value.collectibleProductId] = value
			table.insert(List, {
				collectibleProductId = value.collectibleProductId,
				collectibleItemId = value.collectibleItemId,
				agreedPriceRobux = value.agreedPriceRobux,
				rentalOption = if value.rentalDays and value.rentalDays > 0 then { durationDays = value.rentalDays } else nil,
				offerIds = value.offerIds
			})
		end
		return if #List == 0 then PromiseModule.reject(PurchaseErrorModule.UnknownFailure) else p3.performLookPurchaseBulkPurchase(p4, p5.idempotencyKey, List):andThen(function(Result) --[[ Line: 100 ]]
			-- upvalues: Logging (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsEconomicRestrictionResponseFunction (upval), toLegacyLookPurchaseResult (upval), t (copy)
			if type(Result) ~= "table" then
				Logging.warn("Response from performLookPurchase is malformed!")
				
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
			elseif IsEconomicRestrictionResponseFunction(Result) then
				return PromiseModule.reject(Result)
			else
				local LegacyLookPurchaseResult = toLegacyLookPurchaseResult(Result, t)
				
				return if LegacyLookPurchaseResult.purchaseLookStatus == "Success" or LegacyLookPurchaseResult.purchaseLookStatus == "PartialSuccess" then PromiseModule.resolve(LegacyLookPurchaseResult) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
			end
		end, function(p6) --[[ Line: 119 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(p6)
		end)
	end
else
	return function(p6, p7, p8) --[[ Line: 126 | Named "performLookPurchase" ]]
		-- upvalues: Logging (copy), PromiseModule (copy), PurchaseErrorModule (copy), IsEconomicRestrictionResponseFunction (copy)
		return p6.performLookPurchase(p7, p8):andThen(function(Result) --[[ Line: 127 ]]
			-- upvalues: Logging (upval), PromiseModule (upval), PurchaseErrorModule (upval), IsEconomicRestrictionResponseFunction (upval)
			if type(Result) == "table" then
				return if IsEconomicRestrictionResponseFunction(Result) then PromiseModule.reject(Result) elseif Result.purchaseLookStatus == "Success" or Result.purchaseLookStatus == "PartialSuccess" then PromiseModule.resolve(Result) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
			else
				Logging.warn("Response from performLookPurchase is malformed!")
				
				return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
			end
		end, function(p9) --[[ Line: 145 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(p9)
		end)
	end
end