local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local DiscountType = require(Parent.IAPExperience).DiscountType
local IsRequestTypeHiddenFromBlackbirdUpsellFunction = require(script.Parent.Parent.Utils.BlackbirdUpsellRequestTypeGating).isRequestTypeHiddenFromBlackbirdUpsell
local BlackbirdUpsellImpressionTrackerModule = require(script.Parent.BlackbirdUpsellImpressionTracker)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)
local FFlagBlackbirdUpsellGateTimedOptionModule = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateTimedOption)
local FFlagBlackbirdUpsellGateResaleModule = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateResale)
local FFlagEnableBlackbirdUpsellImpressionGating = SharedFlagsModule.FFlagEnableBlackbirdUpsellImpressionGating
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p1, p2, p3, p4): boolean
	-- upvalues: FFlagBlackbirdUpsellGateTimedOptionModule (copy), FFlagBlackbirdUpsellGateResaleModule (copy), GetAppFeaturePoliciesFunction (copy), IsRequestTypeHiddenFromBlackbirdUpsellFunction (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), DiscountType (copy), FFlagEnableBlackbirdUpsellImpressionGating (copy), BlackbirdUpsellImpressionTrackerModule (copy)
	if p3 then
		return false
	end
	if FFlagBlackbirdUpsellGateTimedOptionModule and p4 then
		local TimedOptionDays = p4.timedOptionDays
		
		if TimedOptionDays and TimedOptionDays ~= 0 then
			return false
		end
	end
	if FFlagBlackbirdUpsellGateResaleModule and p4 then
		local CollectibleItemInstanceId = p4.collectibleItemInstanceId
		
		if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
			return false
		end
	end
	if GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then
		return false
	end
	if p2 and IsRequestTypeHiddenFromBlackbirdUpsellFunction(p2) then
		return false
	end
	if p1 then
		local BasePriceInRobux = p1.basePriceInRobux
		
		if BasePriceInRobux <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or FIntBlackbirdUpsellMaxPriceForDiscountInclusive ~= 0 and FIntBlackbirdUpsellMaxPriceForDiscountInclusive <= BasePriceInRobux then
			return false
		end
	end
	if p1 then
		local Discounts = p1.discounts
		
		if Discounts then
			for _, discount in Discounts do
				if discount.type == DiscountType.BlackbirdSubscription or discount.type == DiscountType.RobloxPlusSubscription then
					return false
				end
			end
		end
	end
	return not FFlagEnableBlackbirdUpsellImpressionGating or not BlackbirdUpsellImpressionTrackerModule.hasReachedMaxImpressions()
end