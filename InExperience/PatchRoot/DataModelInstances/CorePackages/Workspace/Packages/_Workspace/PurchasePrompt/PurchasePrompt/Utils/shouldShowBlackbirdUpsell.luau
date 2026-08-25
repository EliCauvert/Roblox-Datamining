local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local discountType = require(parent.IAPExperience).DiscountType
local isRequestTypeHiddenFromBlackbirdUpsell = require(script.Parent.Parent.Utils.BlackbirdUpsellRequestTypeGating).isRequestTypeHiddenFromBlackbirdUpsell
local blackbirdUpsellImpressionTrackerModule = require(script.Parent.BlackbirdUpsellImpressionTracker)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)
local fFlagBlackbirdUpsellGateTimedOptionModule = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateTimedOption)
local fFlagBlackbirdUpsellGateResaleModule = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateResale)
local fFlagEnableBlackbirdUpsellImpressionGating = sharedFlagsModule.FFlagEnableBlackbirdUpsellImpressionGating
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p0, p1, p2, p3)
	-- upvalues: fFlagBlackbirdUpsellGateTimedOptionModule (ref), fFlagBlackbirdUpsellGateResaleModule (ref), getAppFeaturePolicies (ref), isRequestTypeHiddenFromBlackbirdUpsell (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), discountType (ref), fFlagEnableBlackbirdUpsellImpressionGating (ref), blackbirdUpsellImpressionTrackerModule (ref)
	if p2 then
		return false
	elseif fFlagBlackbirdUpsellGateTimedOptionModule and p3 then
		local timedOptionDays = p3.timedOptionDays
		
		if timedOptionDays and timedOptionDays ~= 0 then
			return false
		elseif fFlagBlackbirdUpsellGateResaleModule and p3 then
			local basePriceInRobux
			local collectibleItemInstanceId = p3.collectibleItemInstanceId
			
			if collectibleItemInstanceId and collectibleItemInstanceId ~= "" then
				return false
			elseif getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
				return false
			elseif p1 and isRequestTypeHiddenFromBlackbirdUpsell(p1) then
				return false
			elseif p0 then
				basePriceInRobux = p0.basePriceInRobux
				local var5 = fIntBlackbirdUpsellMaxPriceForDiscountInclusive
				
				if basePriceInRobux <= fIntBlackbirdUpsellMinPriceForDiscountInclusive or var5 ~= 0 and var5 <= basePriceInRobux then
					return false
				elseif p0 then
					basePriceInRobux = p0.discounts
					
					if basePriceInRobux then
						for i, v in basePriceInRobux do
							if v.type == discountType.BlackbirdSubscription or v.type == discountType.RobloxPlusSubscription then
								return false
							end
						end
					end
				end
				return fFlagEnableBlackbirdUpsellImpressionGating and blackbirdUpsellImpressionTrackerModule.hasReachedMaxImpressions()
			end
		end
	end
end