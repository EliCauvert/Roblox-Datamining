local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.AdCampaignEligibility)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)

local function isUsableOffer(p1)
	local var1 = false
	
	if typeof(p1) == "table" then
		if p1.campaignOption ~= "feedback" then
			var1 = false
			
			if p1.campaignOption == "plays" then
				if p1.fundingType ~= "free" then
					var1 = false
					
					if p1.fundingType == "paid" then
						var1 = typeof(p1.durationDays) == "number" and (p1.durationDays % 1 == 0 and (p1.durationDays > 0 and (typeof(p1.priceRobux) == "number" and (p1.priceRobux % 1 == 0 and (p1.priceRobux >= 0 and (if p1.fundingType ~= "free" then p1.priceRobux > 0 else true))))))
					end
				end
			end
		end
	end
	return var1
end

local function getSelectableOffers(p1)
	-- upvalues: isUsableOffer (ref)
	if p1 == nil or typeof(p1.offers) ~= "table" then
		return nil
	end
	local var1 = nil
	local var2 = nil
	
	for i, v in p1.offers do
		local var3 = isUsableOffer(v) and (if v.fundingType ~= "paid" then v.fundingType == "free" and p1.freeCreditsRemaining > 0 else true)
		
		if var3 and v.campaignOption == "feedback" then
			var1 = v
		elseif var3 and v.campaignOption == "plays" then
			var2 = v
		end
	end
	return if var1 == nil and var2 == nil then nil else { feedback = var1, plays = var2 }
end

return {
	isEligibleForFreePromotion = function(p2)
		-- upvalues: fFlagEnablePaidAdsModule (ref), isUsableOffer (ref)
		if p2 == nil or p2.userEligible ~= true or p2.universeEligible ~= true then
			return false
		elseif not fFlagEnablePaidAdsModule then
			return p2.cardType == "promote_free"
		elseif typeof(p2.offers) ~= "table" then
			return false
		end
		for i, v in p2.offers do
			if isUsableOffer(v) and v.fundingType == "free" then
				return true
			end
		end
		return false
	end,
	freeCreditsRemaining = function(p3)
		return if p3 == nil then 0 else p3.freeCreditsRemaining
	end,
	hasFreeCredit = function(p3)
		return (if p3 ~= nil then 0 else p3.freeCreditsRemaining) > 0
	end,
	hasUsableOffer = function(p3)
		-- upvalues: fFlagEnablePaidAdsModule (ref), getSelectableOffers (ref)
		if fFlagEnablePaidAdsModule then
			return getSelectableOffers(p3) ~= nil
		end
		local var4 = if p3 ~= nil then nil else p3.offer
		
		return var4 ~= nil and var4.durationDays > 0
	end,
	getSelectableOffers = getSelectableOffers
}