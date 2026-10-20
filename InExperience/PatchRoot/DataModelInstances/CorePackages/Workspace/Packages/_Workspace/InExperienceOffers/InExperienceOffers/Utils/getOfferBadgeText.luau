local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local GetOffersForKeyModule = require(InExperienceOffers.Utils.getOffersForKey)
local SelectActiveOfferModule = require(InExperienceOffers.Utils.selectActiveOffer)
local _ = require(InExperienceOffers.Types)

return function(p1, p2)
	-- upvalues: GetOffersForKeyModule (copy), SelectActiveOfferModule (copy)
	if p2 == nil then
		return nil
	end
	local MenuBadge = SelectActiveOfferModule(GetOffersForKeyModule(p1, p2), "menuBadge")
	
	if MenuBadge == nil then
		return nil
	else
		local MenuBadge1 = MenuBadge.presentationData.menuBadge
		
		return if MenuBadge1 == nil then nil else MenuBadge1.title
	end
end