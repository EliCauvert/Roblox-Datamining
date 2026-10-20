local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration.AdCampaignEligibility)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)

local function isUsableOffer(p1): boolean
	return typeof(p1) == "table" and (if p1.campaignOption == "feedback" then if p1.fundingType == "free" then typeof(p1.durationDays) == "number" and (p1.durationDays % 1 == 0 and (p1.durationDays > 0 and (typeof(p1.priceRobux) == "number" and (p1.priceRobux % 1 == 0 and p1.priceRobux >= 0)))) and (p1.fundingType == "free" or p1.priceRobux > 0) else p1.fundingType == "paid" and (typeof(p1.durationDays) == "number" and (p1.durationDays % 1 == 0 and (p1.durationDays > 0 and (typeof(p1.priceRobux) == "number" and (p1.priceRobux % 1 == 0 and p1.priceRobux >= 0)))) and (p1.fundingType == "free" or p1.priceRobux > 0)) else p1.campaignOption == "plays" and (if p1.fundingType == "free" then typeof(p1.durationDays) == "number" and (p1.durationDays % 1 == 0 and (p1.durationDays > 0 and (typeof(p1.priceRobux) == "number" and (p1.priceRobux % 1 == 0 and p1.priceRobux >= 0)))) and (p1.fundingType == "free" or p1.priceRobux > 0) else p1.fundingType == "paid" and (typeof(p1.durationDays) == "number" and (p1.durationDays % 1 == 0 and (p1.durationDays > 0 and (typeof(p1.priceRobux) == "number" and (p1.priceRobux % 1 == 0 and p1.priceRobux >= 0)))) and (p1.fundingType == "free" or p1.priceRobux > 0))))
end

local function getSelectableOffers(p1)
	-- upvalues: isUsableOffer (copy)
	if p1 == nil or typeof(p1.offers) ~= "table" then
		return nil
	end
	local Feedback = nil
	local Plays = nil
	
	for _, offer in p1.offers do
		local IsPaid: boolean = isUsableOffer(offer) and (offer.fundingType == "paid" or offer.fundingType == "free" and p1.freeCreditsRemaining > 0)
		
		if IsPaid and offer.campaignOption == "feedback" then
			Feedback = offer
		elseif IsPaid and offer.campaignOption == "plays" then
			Plays = offer
		end
	end
	return if Feedback == nil and Plays == nil then nil else { feedback = Feedback, plays = Plays }
end

local function isEligibleForFreePromotion(p2): boolean
	-- upvalues: FFlagEnablePaidAdsModule (copy), isUsableOffer (copy)
	if p2 == nil or p2.userEligible ~= true or p2.universeEligible ~= true then
		return false
	end
	if not FFlagEnablePaidAdsModule then
		return p2.cardType == "promote_free"
	end
	if typeof(p2.offers) ~= "table" then
		return false
	end
	for _, offer in p2.offers do
		if isUsableOffer(offer) and offer.fundingType == "free" then
			return true
		end
	end
	return false
end

return {
	getDefaultOffer = function(p3)
		return if p3.feedback == nil or p3.feedback.fundingType ~= "free" then (p3.plays == nil or p3.plays.fundingType ~= "free") and p3.feedback or p3.plays else p3.feedback
	end,
	isEligibleForFreePromotion = isEligibleForFreePromotion,
	freeCreditsRemaining = function(p3)
		return if p3 == nil then 0 else p3.freeCreditsRemaining
	end,
	hasFreeCredit = function(p3): boolean
		return (if p3 == nil then 0 else p3.freeCreditsRemaining) > 0
	end,
	hasUsableOffer = function(p3): boolean
		-- upvalues: FFlagEnablePaidAdsModule (copy), getSelectableOffers (copy)
		if FFlagEnablePaidAdsModule then
			return getSelectableOffers(p3) ~= nil
		else
			local Offer = if p3 == nil then nil else p3.offer
			
			return Offer ~= nil and Offer.durationDays > 0
		end
	end,
	getSelectableOffers = getSelectableOffers,
	canCreateCampaign = function(p3)
		-- upvalues: FFlagEnablePaidAdsModule (copy), getSelectableOffers (copy), isEligibleForFreePromotion (copy)
		if p3 == nil or p3.userEligible ~= true or p3.universeEligible ~= true then
			return false
		end
		if FFlagEnablePaidAdsModule then
			return getSelectableOffers(p3) ~= nil
		end
		local IsEligibleForFreePromotion = isEligibleForFreePromotion(p3)
		
		if IsEligibleForFreePromotion then
			IsEligibleForFreePromotion = (if p3 == nil then 0 else p3.freeCreditsRemaining) > 0
			
			if IsEligibleForFreePromotion then
				if FFlagEnablePaidAdsModule then
					return getSelectableOffers(p3) ~= nil
				end
				local Offer = if p3 == nil then nil else p3.offer
				IsEligibleForFreePromotion = Offer ~= nil and Offer.durationDays > 0
			end
		end
		return IsEligibleForFreePromotion
	end,
	campaignSheetTerms = function(p3, RunStartMs)
		-- upvalues: FFlagEnablePaidAdsModule (copy), getSelectableOffers (copy)
		local Offer = if p3 == nil then nil else p3.offer
		
		return {
			runStartMs = RunStartMs,
			durationDays = if Offer == nil then nil else Offer.durationDays,
			estimatedPriceRobux = if Offer == nil then nil else Offer.displayAmountRobux,
			campaignOffers = if FFlagEnablePaidAdsModule then getSelectableOffers(p3) else nil
		}
	end
}