local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local getOffersForKeyModule = require(inExperienceOffers.Utils.getOffersForKey)
local selectActiveOfferModule = require(inExperienceOffers.Utils.selectActiveOffer)
local _ = require(inExperienceOffers.Types)

return function(p1, p2)
	-- upvalues: getOffersForKeyModule (ref), selectActiveOfferModule (ref)
	if p2 == nil then
		return nil
	end
	local var1 = selectActiveOfferModule(getOffersForKeyModule(p1, p2), "menuBadge")
	
	if var1 == nil then
		return nil
	end
	local menuBadge = var1.presentationData.menuBadge
	
	return if menuBadge == nil then nil else menuBadge.title
end