local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local GetOffersForKeyModule = require(InExperienceOffers.Utils.getOffersForKey)
local _ = require(InExperienceOffers.Types)

return function(p1, List): boolean --[[ Line: 12 | Named "hasOfferForAnyKey" ]]
	-- upvalues: GetOffersForKeyModule (copy)
	for _, value in List do
		if GetOffersForKeyModule(p1, value) ~= nil then
			return true
		end
	end
	return false
end