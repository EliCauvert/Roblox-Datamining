local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local IAPExperienceModule = require(Parent.IAPExperience)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local DiscountType = IAPExperienceModule.DiscountType
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local IsRequestTypeHiddenFromBlackbirdUpsellFunction = require(script.Parent.Parent.Utils.BlackbirdUpsellRequestTypeGating).isRequestTypeHiddenFromBlackbirdUpsell
local BlackbirdUpsellImpressionTrackerModule = require(script.Parent.BlackbirdUpsellImpressionTracker)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)
local FFlagBlackbirdUpsellGateTimedOptionModule = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateTimedOption)
local FFlagBlackbirdUpsellGateResaleModule = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateResale)
local FFlagEnableBlackbirdUpsellImpressionGating = SharedFlagsModule.FFlagEnableBlackbirdUpsellImpressionGating
local FFlagBlackbirdUpsellGateResalePurchaseType = SharedFlagsModule.FFlagBlackbirdUpsellGateResalePurchaseType
local FFlagEnableRobuxUpsellPlusButtonExperiment = IAPExperienceModule.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p1, VIPServer, p2, p3, p4): boolean
	-- upvalues: RequestTypeModule (copy), FFlagBlackbirdUpsellGateTimedOptionModule (copy), FFlagBlackbirdUpsellGateResalePurchaseType (copy), FFlagBlackbirdUpsellGateResaleModule (copy), GetAppFeaturePoliciesFunction (copy), IsRequestTypeHiddenFromBlackbirdUpsellFunction (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), DiscountType (copy), FFlagEnableRobuxUpsellPlusButtonExperiment (copy), FFlagEnableBlackbirdUpsellImpressionGating (copy), BlackbirdUpsellImpressionTrackerModule (copy)
	if p2 then
		return false
	end
	if VIPServer == RequestTypeModule.VIPServer then
		return false
	end
	if FFlagBlackbirdUpsellGateTimedOptionModule and p3 then
		local TimedOptionDays = p3.timedOptionDays
		
		if TimedOptionDays and TimedOptionDays ~= 0 then
			return false
		end
	end
	if FFlagBlackbirdUpsellGateResalePurchaseType and p3 and p3.isPurchaseFromResale == true then
		return false
	end
	if FFlagBlackbirdUpsellGateResaleModule and p3 then
		local CollectibleItemInstanceId = p3.collectibleItemInstanceId
		
		if CollectibleItemInstanceId and CollectibleItemInstanceId ~= "" then
			return false
		end
	end
	if GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then
		return false
	end
	if VIPServer and IsRequestTypeHiddenFromBlackbirdUpsellFunction(VIPServer) then
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
	return if FFlagEnableRobuxUpsellPlusButtonExperiment and p4 or not FFlagEnableBlackbirdUpsellImpressionGating or not BlackbirdUpsellImpressionTrackerModule.hasReachedMaxImpressions() then true else false
end