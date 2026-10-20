local CorePackages = game:GetService("CorePackages")
local FFlagExperienceAgeRatingBadge = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local FFlagShowGameAgeRating = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating

return {
	keepOutAreaId = "experience-age-rating",
	isEligible = function(Enabled, p1, p2, p3): boolean
		-- upvalues: FFlagExperienceAgeRatingBadge (copy), FFlagShowGameAgeRating (copy)
		return FFlagExperienceAgeRatingBadge and (FFlagShowGameAgeRating and (Enabled == true and (p1 and (p2 and not p3))))
	end
}