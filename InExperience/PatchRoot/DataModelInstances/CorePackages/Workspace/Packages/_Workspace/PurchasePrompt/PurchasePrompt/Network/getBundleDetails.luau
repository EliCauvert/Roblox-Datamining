local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local promiseModule = require(parent.Promise)
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local getCatalogItemDetailsModule = require(parent.Network.getCatalogItemDetails)
local getResellersModule = require(parent.Network.getResellers)
local resolveRefreshedExpectedPriceModule = require(parent.Utils.resolveRefreshedExpectedPrice)
local fFlagFixTimedOptionRefreshModule = require(parent.Flags.FFlagFixTimedOptionRefresh)
local resolveRefreshedProductInfoModule = require(parent.Utils.resolveRefreshedProductInfo)

local function convertDiscountInfoToPriceDiscountDetails(p0) --[[ line: 21 ]]
	if not p0 or type(p0.discounts) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p0.discounts) do
		table.insert(t, {
			Type = v.discountCampaign,
			AmountInRobux = v.robuxDiscountAmount,
			Percent = v.robuxDiscountPercentage
		})
	end
	return t
end

local function normalizeBundleFields(p1) --[[ line: 36 ]]
	-- upvalues: fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), convertDiscountInfoToPriceDiscountDetails (ref)
	if not fFlagEnableDiscountInfoInUnifiedPurchaseModal then
		return p1
	elseif not p1.UserBasePriceInRobux then
		local discountInformation = p1.discountInformation
		p1.UserBasePriceInRobux = p1.BasePriceInRobux or ((if discountInformation then discountInformation.originalPrice else nil) or (p1.PriceInRobux or ((if p1.product then p1.product.priceInRobux else nil) or 0)))
	end
	if not p1.PriceDiscountDetails and p1.discountInformation then
		p1.PriceDiscountDetails = convertDiscountInfoToPriceDiscountDetails(p1.discountInformation)
	end
	return p1
end

return function(p2, p3, p4) --[[ line: 57 | named "getBundleDetails" ]]
	-- upvalues: promiseModule (ref), normalizeBundleFields (ref), purchaseErrorModule (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), getCatalogItemDetailsModule (ref), getResellersModule (ref), fFlagFixTimedOptionRefreshModule (ref), resolveRefreshedProductInfoModule (ref), resolveRefreshedExpectedPriceModule (ref)
	local var11 = p2.getBundleDetails(p3):andThen(function(p5) --[[ line: 60 ]]
		-- upvalues: promiseModule (copy), normalizeBundleFields (copy)
		return promiseModule.resolve(normalizeBundleFields(p5))
	end):catch(function(_) --[[ line: 63 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
	
	if not fFlagRefreshPriceOnRetryAfterUpsellModule or not p4 then
		return var11
	end
	local collectibleItemId = p4.collectibleItemId
	local collectibleItemInstanceId = p4.collectibleItemInstanceId
	
	return promiseModule.all({
		bundleDetails = var11,
		refreshedExpectedPrice = promiseModule.all({
			catalogItemDetails = getCatalogItemDetailsModule(p2, p3, "bundle"):catch(function() --[[ line: 76 ]]
				return nil
			end),
			resellersData = if collectibleItemInstanceId and collectibleItemInstanceId ~= "" and (collectibleItemId and collectibleItemId ~= "") then getResellersModule(p2, collectibleItemId, 10):catch(function() --[[ line: 83 ]]
				return nil
			end) else promiseModule.resolve(nil)
		}):andThen(function(p7) --[[ line: 87 ]]
			-- upvalues: fFlagFixTimedOptionRefreshModule (copy), resolveRefreshedProductInfoModule (copy), collectibleItemInstanceId (ref), p4 (ref), resolveRefreshedExpectedPriceModule (copy)
			return if fFlagFixTimedOptionRefreshModule then resolveRefreshedProductInfoModule(p7.catalogItemDetails, p7.resellersData, collectibleItemInstanceId, p4.timedOptionDays) else resolveRefreshedExpectedPriceModule(p7.catalogItemDetails, p7.resellersData, collectibleItemInstanceId, p4.timedOptionDays)
		end)
	}):andThen(function(p6) --[[ line: 107 ]]
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