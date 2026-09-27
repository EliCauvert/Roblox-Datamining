local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local IAPExperienceModule = require(parent.IAPExperience)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local discountType = IAPExperienceModule.DiscountType
local isRequestTypeHiddenFromBlackbirdUpsell = require(script.Parent.Parent.Utils.BlackbirdUpsellRequestTypeGating).isRequestTypeHiddenFromBlackbirdUpsell
local blackbirdUpsellImpressionTrackerModule = require(script.Parent.BlackbirdUpsellImpressionTracker)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)
local fFlagBlackbirdUpsellGateTimedOptionModule = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateTimedOption)
local fFlagBlackbirdUpsellGateResaleModule = require(purchasePrompt.Flags.FFlagBlackbirdUpsellGateResale)
local fFlagEnableBlackbirdUpsellImpressionGating = sharedFlagsModule.FFlagEnableBlackbirdUpsellImpressionGating
local fFlagBlackbirdUpsellGateResalePurchaseType = sharedFlagsModule.FFlagBlackbirdUpsellGateResalePurchaseType
local fFlagEnableRobuxUpsellPlusButtonExperiment = IAPExperienceModule.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment
local fIntBlackbirdUpsellMinPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local fIntBlackbirdUpsellMaxPriceForDiscountInclusive = sharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagBlackbirdUpsellGateTimedOptionModule (ref), fFlagBlackbirdUpsellGateResalePurchaseType (ref), fFlagBlackbirdUpsellGateResaleModule (ref), getAppFeaturePolicies (ref), isRequestTypeHiddenFromBlackbirdUpsell (ref), fIntBlackbirdUpsellMaxPriceForDiscountInclusive (ref), fIntBlackbirdUpsellMinPriceForDiscountInclusive (ref), discountType (ref), fFlagEnableRobuxUpsellPlusButtonExperiment (ref), fFlagEnableBlackbirdUpsellImpressionGating (ref), blackbirdUpsellImpressionTrackerModule (ref)
	if p3 then
		return false
	elseif fFlagBlackbirdUpsellGateTimedOptionModule and p4 then
		local timedOptionDays = p4.timedOptionDays
		
		if timedOptionDays and timedOptionDays ~= 0 then
			return false
		elseif fFlagBlackbirdUpsellGateResalePurchaseType and p4 and p4.isPurchaseFromResale == true then
			return false
		elseif fFlagBlackbirdUpsellGateResaleModule and p4 then
			local basePriceInRobux
			local collectibleItemInstanceId = p4.collectibleItemInstanceId
			
			if collectibleItemInstanceId and collectibleItemInstanceId ~= "" then
				return false
			elseif getAppFeaturePolicies().getDisableBlackbirdEntrypoints() then
				return false
			elseif p2 and isRequestTypeHiddenFromBlackbirdUpsell(p2) then
				return false
			elseif p1 then
				basePriceInRobux = p1.basePriceInRobux
				local var1 = fIntBlackbirdUpsellMaxPriceForDiscountInclusive
				
				if basePriceInRobux <= fIntBlackbirdUpsellMinPriceForDiscountInclusive or var1 ~= 0 and var1 <= basePriceInRobux then
					return false
				elseif p1 then
					basePriceInRobux = p1.discounts
					
					if basePriceInRobux then
						for i, v in basePriceInRobux do
							if v.type == discountType.BlackbirdSubscription or v.type == discountType.RobloxPlusSubscription then
								return false
							end
						end
					end
				end
				return fFlagEnableRobuxUpsellPlusButtonExperiment and p5 or not fFlagEnableBlackbirdUpsellImpressionGating or not blackbirdUpsellImpressionTrackerModule.hasReachedMaxImpressions()
			end
		end
	end
end