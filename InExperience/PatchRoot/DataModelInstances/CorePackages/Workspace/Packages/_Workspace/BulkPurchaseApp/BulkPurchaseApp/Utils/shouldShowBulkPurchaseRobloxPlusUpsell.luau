local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local discountType = require(parent.IAPExperience).DiscountType
local sharedFlagsModule = require(parent.SharedFlags)
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(bulkPurchaseApp.Features.BulkPurchaseRequest.BulkPurchaseRequestItem)

local function cartAlreadyHasRobloxPlusDiscount(p1)
	-- upvalues: discountType (ref)
	if not p1 then
		return false
	end
	for i, v in p1.discounts do
		local discountCampaign = discountType[v.discountCampaign]
		
		if discountCampaign == discountType.BlackbirdSubscription or discountCampaign == discountType.RobloxPlusSubscription then
			return true
		end
	end
	return false
end

local function _(p2)
	-- upvalues: fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref)
	return if p2 < fIntBlackbirdUpsellMinPriceForDiscountInclusive then false else fIntBlackbirdUpsellMaxPriceForDiscountInclusive == 0 or fIntBlackbirdUpsellMaxPriceForDiscountInclusive >= p2
end

return function(p2, p3, p4)
	-- upvalues: getAppFeaturePolicies (ref), cartAlreadyHasRobloxPlusDiscount (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref)
	if not p4 then
		return false
	elseif getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
		return false
	elseif cartAlreadyHasRobloxPlusDiscount(p3) then
		return false
	end
	for i, v in p2 do
		if not v.timedOptionDays then
			local var1
			local cost = v.cost
			local var2 = fIntBlackbirdUpsellMaxPriceForDiscountInclusive
			
			if cost < fIntBlackbirdUpsellMinPriceForDiscountInclusive then
				var1 = false
			elseif var2 ~= 0 then
				var1 = var2 >= cost
			end
			if var1 then
				return true
			end
		end
	end
	return false
end