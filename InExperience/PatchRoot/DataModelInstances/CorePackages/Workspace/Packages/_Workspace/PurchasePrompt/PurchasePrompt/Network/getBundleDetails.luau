local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local _ = require(parent.Parent.LuauPolyfill)
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local fFlagEnableFetchCartPricingDuringInExperience = require(parent.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local getCatalogItemDetailsModule = require(parent.Network.getCatalogItemDetails)
local getResellersModule = require(parent.Network.getResellers)
local resolveRefreshedExpectedPriceModule = require(parent.Utils.resolveRefreshedExpectedPrice)
local fFlagFixTimedOptionRefreshModule = require(parent.Flags.FFlagFixTimedOptionRefresh)
local resolveRefreshedProductInfoModule = require(parent.Utils.resolveRefreshedProductInfo)

local function convertDiscountInfoToPriceDiscountDetails(p1)
	if not p1 or type(p1.discounts) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p1.discounts) do
		table.insert(t, {
			Type = v.discountCampaign,
			AmountInRobux = v.robuxDiscountAmount,
			Percent = v.robuxDiscountPercentage
		})
	end
	return t
end

local function normalizeBundleFields(p2)
	-- upvalues: convertDiscountInfoToPriceDiscountDetails (ref)
	if not p2.UserBasePriceInRobux then
		local discountInformation = p2.discountInformation
		p2.UserBasePriceInRobux = p2.BasePriceInRobux or ((if discountInformation then discountInformation.originalPrice else nil) or (p2.PriceInRobux or ((if p2.product then p2.product.priceInRobux else nil) or 0)))
	end
	if not p2.PriceDiscountDetails and p2.discountInformation then
		p2.PriceDiscountDetails = convertDiscountInfoToPriceDiscountDetails(p2.discountInformation)
	end
	return p2
end

return function(p2, p3, p4, p5)
	-- upvalues: fFlagEnableFetchCartPricingDuringInExperience (ref), normalizeBundleFields (ref), promiseModule (ref), purchaseErrorModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), getCatalogItemDetailsModule (ref), getResellersModule (ref), fFlagFixTimedOptionRefreshModule (ref), resolveRefreshedProductInfoModule (ref), resolveRefreshedExpectedPriceModule (ref)
	local var1 = p2.getBundleDetails(p3):andThen(function(p6)
		-- upvalues: fFlagEnableFetchCartPricingDuringInExperience (copy), p5 (ref), normalizeBundleFields (copy), promiseModule (copy)
		return if fFlagEnableFetchCartPricingDuringInExperience and p6.collectibleItemDetail and (p6.collectibleItemDetail.collectibleItemId and p5) then p5(p6.collectibleItemDetail.collectibleItemId):andThen(function()
			-- upvalues: normalizeBundleFields (copy), p6 (ref)
			return normalizeBundleFields(p6)
		end):catch(function()
			-- upvalues: normalizeBundleFields (copy), p6 (ref)
			return normalizeBundleFields(p6)
		end) else promiseModule.resolve(normalizeBundleFields(p6))
	end):catch(function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
	
	if not fFlagRefreshPriceOnRetryAfterUpsellModule or not p4 then
		return var1
	end
	local collectibleItemId = p4.collectibleItemId
	local collectibleItemInstanceId = p4.collectibleItemInstanceId
	
	return promiseModule.all({
		bundleDetails = var1,
		refreshedExpectedPrice = promiseModule.all({
			catalogItemDetails = getCatalogItemDetailsModule(p2, p3, "bundle"):catch(function()
				return nil
			end),
			resellersData = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" and (collectibleItemId and collectibleItemId ~= "") then getResellersModule(p2, collectibleItemId, 10):catch(function()
				return nil
			end) else promiseModule.resolve(nil)
		}):andThen(function(p6)
			-- upvalues: fFlagFixTimedOptionRefreshModule (copy), resolveRefreshedProductInfoModule (copy), collectibleItemInstanceId (ref), p4 (ref), resolveRefreshedExpectedPriceModule (copy)
			return if fFlagFixTimedOptionRefreshModule then resolveRefreshedProductInfoModule(p6.catalogItemDetails, p6.resellersData, collectibleItemInstanceId, p4.timedOptionDays) else resolveRefreshedExpectedPriceModule(p6.catalogItemDetails, p6.resellersData, collectibleItemInstanceId, p4.timedOptionDays)
		end)
	}):andThen(function(p6)
		-- upvalues: fFlagFixTimedOptionRefreshModule (copy)
		local bundleDetails = p6.bundleDetails
		
		if fFlagFixTimedOptionRefreshModule then
			local refreshedExpectedPrice = p6.refreshedExpectedPrice
			
			if refreshedExpectedPrice == nil then
				return bundleDetails
			end
			for i, v in pairs(refreshedExpectedPrice) do
				bundleDetails[i] = v
			end
			return bundleDetails
		else
			bundleDetails.refreshedExpectedPrice = p6.refreshedExpectedPrice
		end
	end)
end