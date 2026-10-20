local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local PromiseModule = require(Parent.Promise)
local FFlagRefreshPriceOnRetryAfterUpsellModule = require(Parent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local FFlagEnableDiscountInfoInUnifiedPurchaseModal = require(Parent.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local GetCatalogItemDetailsModule = require(Parent.Network.getCatalogItemDetails)
local GetResellersModule = require(Parent.Network.getResellers)
local ResolveRefreshedExpectedPriceModule = require(Parent.Utils.resolveRefreshedExpectedPrice)
local FFlagFixTimedOptionRefreshModule = require(Parent.Flags.FFlagFixTimedOptionRefresh)
local ResolveRefreshedProductInfoModule = require(Parent.Utils.resolveRefreshedProductInfo)

local function convertDiscountInfoToPriceDiscountDetails(DiscountInformation)
	if not DiscountInformation or type(DiscountInformation.discounts) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, discount in ipairs(DiscountInformation.discounts) do
		table.insert(List, {
			Type = discount.discountCampaign,
			AmountInRobux = discount.robuxDiscountAmount,
			Percent = discount.robuxDiscountPercentage
		})
	end
	return List
end

local function normalizeBundleFields(p1)
	-- upvalues: FFlagEnableDiscountInfoInUnifiedPurchaseModal (copy), convertDiscountInfoToPriceDiscountDetails (copy)
	if not FFlagEnableDiscountInfoInUnifiedPurchaseModal then
		return p1
	end
	if not p1.UserBasePriceInRobux then
		local DiscountInformation = p1.discountInformation
		p1.UserBasePriceInRobux = p1.BasePriceInRobux or ((if DiscountInformation then DiscountInformation.originalPrice else nil) or (p1.PriceInRobux or ((if p1.product then p1.product.priceInRobux else nil) or 0)))
	end
	if not p1.PriceDiscountDetails and p1.discountInformation then
		p1.PriceDiscountDetails = convertDiscountInfoToPriceDiscountDetails(p1.discountInformation)
	end
	return p1
end

return function(p1, p2, p3)
	-- upvalues: PromiseModule (copy), normalizeBundleFields (copy), PurchaseErrorModule (copy), FFlagRefreshPriceOnRetryAfterUpsellModule (copy), GetCatalogItemDetailsModule (copy), GetResellersModule (copy), FFlagFixTimedOptionRefreshModule (copy), ResolveRefreshedProductInfoModule (copy), ResolveRefreshedExpectedPriceModule (copy)
	local BundleDetails = p1.getBundleDetails(p2):andThen(function(Result)
		-- upvalues: PromiseModule (upval), normalizeBundleFields (upval)
		return PromiseModule.resolve((normalizeBundleFields(Result)))
	end):catch(function(_)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
	
	if FFlagRefreshPriceOnRetryAfterUpsellModule and p3 then
		local CollectibleItemId = p3.collectibleItemId
		local CollectibleItemInstanceId = p3.collectibleItemInstanceId
		
		return PromiseModule.all({
			bundleDetails = BundleDetails,
			refreshedExpectedPrice = PromiseModule.all({
				catalogItemDetails = GetCatalogItemDetailsModule(p1, p2, "bundle"):catch(function()
					return nil
				end),
				resellersData = if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" and CollectibleItemId and CollectibleItemId ~= "" then GetResellersModule(p1, CollectibleItemId, 10):catch(function()
					return nil
				end) else PromiseModule.resolve(nil)
			}):andThen(function(Result)
				-- upvalues: FFlagFixTimedOptionRefreshModule (upval), ResolveRefreshedProductInfoModule (upval), CollectibleItemInstanceId (copy), p3 (copy), ResolveRefreshedExpectedPriceModule (upval)
				return if FFlagFixTimedOptionRefreshModule then ResolveRefreshedProductInfoModule(Result.catalogItemDetails, Result.resellersData, CollectibleItemInstanceId, p3.timedOptionDays) else ResolveRefreshedExpectedPriceModule(Result.catalogItemDetails, Result.resellersData, CollectibleItemInstanceId, p3.timedOptionDays)
			end)
		}):andThen(function(Result)
			-- upvalues: FFlagFixTimedOptionRefreshModule (upval)
			local BundleDetails = Result.bundleDetails
			
			if FFlagFixTimedOptionRefreshModule then
				local RefreshedExpectedPrice = Result.refreshedExpectedPrice
				
				if RefreshedExpectedPrice ~= nil then
					for i, value in pairs(RefreshedExpectedPrice) do
						BundleDetails[i] = value
					end
					return BundleDetails
				end
			else
				BundleDetails.refreshedExpectedPrice = Result.refreshedExpectedPrice
			end
			return BundleDetails
		end)
	else
		return BundleDetails
	end
end