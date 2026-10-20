local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Types)
local _ = require(InExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local BonusPromotionEligibilityModule = require(InExperienceShop.Api.BonusPromotionEligibility)

return function(p1, Enabled, Ineligible)
	-- upvalues: BonusPromotionEligibilityModule (copy)
	local BonusItemDetails = p1.bonusItemDetails
	
	if BonusItemDetails == nil then
		return { hasBonusItem = false, bonusItemThumbnail = nil }
	elseif Enabled == true or Ineligible == BonusPromotionEligibilityModule.Ineligible then
		return { hasBonusItem = false, bonusItemThumbnail = nil }
	else
		local Thumbnail = BonusItemDetails.thumbnail
		
		return if Thumbnail == nil then { hasBonusItem = false, bonusItemThumbnail = nil } else { hasBonusItem = true, bonusItemThumbnail = Thumbnail }
	end
end