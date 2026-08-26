local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(inExperienceShop.Types)
local _ = require(inExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local bonusPromotionEligibilityModule = require(inExperienceShop.Api.BonusPromotionEligibility)

return function(p1, p2, p3)
	-- upvalues: bonusPromotionEligibilityModule (ref)
	local bonusItemDetails = p1.bonusItemDetails
	
	if bonusItemDetails == nil then
		return { hasBonusItem = false, bonusItemThumbnail = nil }
	elseif p2 == true or p3 == bonusPromotionEligibilityModule.Ineligible then
		return { hasBonusItem = false, bonusItemThumbnail = nil }
	end
	local thumbnail = bonusItemDetails.thumbnail
	
	return if thumbnail == nil then { hasBonusItem = false, bonusItemThumbnail = nil } else { hasBonusItem = true, bonusItemThumbnail = thumbnail }
end